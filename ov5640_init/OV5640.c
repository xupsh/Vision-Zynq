#include "OV5640.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern xil_i2c *eeprom;
#define  msleep(x)          usleep(1000*x)
static struct sensor ov5640_data;

static struct ov5640_mode_info ov5640_mode_info_data[ov5640_mode_MAX + 1] = {
    {ov5640_mode_QVGA_320_240, 320, 240,
    (struct reg_value *)ov5640_setting_QVGA_320_240,
    ARRAY_SIZE(ov5640_setting_QVGA_320_240)},
    {ov5640_mode_VGA_640_480, 640, 480,
    (struct reg_value *)ov5640_setting_VGA_640_480,
    ARRAY_SIZE(ov5640_setting_VGA_640_480)},
    {ov5640_mode_SVGA_800_600, 800, 600,
    (struct reg_value *)ov5640_setting_SVGA_800_600,
    ARRAY_SIZE(ov5640_setting_SVGA_800_600)},
    {ov5640_mode_XGA_1024_768, 1024, 768,
    (struct reg_value *)ov5640_setting_XGA_1024_768,
    ARRAY_SIZE(ov5640_setting_XGA_1024_768)},
    {ov5640_mode_SXGA_1280_960, 1280, 960,
    (struct reg_value *)ov5640_setting_SXGA_1280_960,
    ARRAY_SIZE(ov5640_setting_SXGA_1280_960)},
    {ov5640_mode_UXGA_1600_1200, 1600, 1200,
    (struct reg_value *)ov5640_setting_UXGA_1600_1200,
    ARRAY_SIZE(ov5640_setting_UXGA_1600_1200)},
    {ov5640_mode_QXGA_2048_1536, 2048, 1536,
    (struct reg_value *)ov5640_setting_QXGA_2048_1536,
    ARRAY_SIZE(ov5640_setting_QXGA_2048_1536)},
    {ov5640_mode_QSXGA_2592_1944, 2592, 1944,
    (struct reg_value *)ov5640_setting_QSXGA_2592_1944,
    ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944)},
};

int wrOV5640Reg(u16 regID, u8 regDat)
{
	u8 status = 0;

	status = eeprom->Write(eeprom, &regID, 2, &regDat, 1); 
	usleep(100);

	return status;
}

u8 rdOV5640Reg(u16 regID, u8 *regDat)
{
	u8 status = 0;
	status = eeprom->Read(eeprom, &regID, 2, regDat, 1);
	usleep(100);
	
	return status;
}

/////////////////////////////////////
#define pr_err      printf
#define pr_debug    printf
#define pr_info     printf

//移植
//0:成功
//-1:失败
static int ov5640_i2c_write(u16 reg, u8 val)
{
    return wrOV5640Reg(reg, val);
}
//0:成功
//-1:失败
static int ov5640_i2c_read(u16 reg, u8 *val)
{
    return rdOV5640Reg(reg, val);
}

static int ov5640_i2c_burst_write(struct reg_value *preg, u32 size)
{
    struct reg_value *pr = preg;
    u32 i, sz = size;
    register u16 reg;
    register u8 val;

    for (i=0; i<sz; ++i, ++pr) {
        reg = pr->reg;
        val = pr->val;
        if (ov5640_i2c_write(reg, val) < 0) 
        {
            pr_err("%s: failed->cnt = %d\r\n", __func__, i);
            printf("try again ...\r\n");
            if (ov5640_i2c_write(reg, val) < 0) 
            {
                printf("try again failed\r\n");
                return -1;
            }

        }
    }

    return 0;
}

// used to check the writed register value for initialization table.
static int ov5640_i2c_burst_read(struct reg_value *preg, u32 size)
{
    struct reg_value *pr = preg;
    u32 i, sz = size;
    u8 val;

    for (i=0; i<sz; ++i, ++pr) {
        if (ov5640_i2c_read(pr->reg, &val) < 0) {
            pr_err("%s: failed.\r\n", __func__);
            return -1;
        } else {
            pr_info("    {0x%04x, 0x%02x}, \r\n", pr->reg, val);
        }
    }

    return 0;
}
/*---------------- auto focus ----------------*/

/*
 * Waiting for ACK for auto focus command.
 */
static int ov5640_af_waiting_for_ack(void)
{
    int i, retval;
    u8 val;

    for (i=0; i<20; i++) {
        retval = ov5640_i2c_read(AF_CMD_ACK_REG, &val);
        if (retval < 0) goto err0;        
        if (!val) return 0;        
        msleep(50);
    }

err0:
    pr_err("%s: failed->retval = %d; i = %d\r\n", __func__, retval, i); 
    return -1;
}

/*
 * Use Trig Auto Focus command to start single auto focus.
 */
static int ov5640_af_trig_single_auto_focus(void)
{
    int i, retval = 0;
    u8 val;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_TRIG_SINGLE_AUTO_FOCUS);
    retval |= ov5640_af_waiting_for_ack();
    retval |= ov5640_i2c_read(AF_CMD_PARA4_REG, &val);
    if ((retval < 0) || (!val)) {
        pr_err("%s: failed.\r\n", __func__);
    } else {
        for (i=0; i<5; i++) {
            if ((val >> i) & 1) 
                pr_debug("%s: Zone(%d) is focused.\r\n", __func__, i);
        }
    }

    return retval;
}

/*
 * Use Continue Auto Focus command to start continue auto focus mode,
 * firmware will auto detect the change of scene and trig auto focus.
 * The continue auto focus is an optional function.
 */
static int ov5640_af_continue_auto_focus(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_CONTINUE_AUTO_FOCUS);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: started.\r\n", __func__);

    return retval;
}

/*
 * Use Pause Auto Focus command to show off the focus window 
 * if the embedded focus window display solution is used.
 */
static int ov5640_af_pause_auto_focus(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_PAUSE_AUTO_FOCUS);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: ok.\r\n", __func__);

    return retval;
}

/*
 * If need to release the VCM to reduce the power or stop continue 
 * auto focus, Release Focus command is needed.
 * After this command, the VCM driver IC will enter soft power down mode,
 * and the lens will focus to infinite object.
 */
static int ov5640_af_release_focus(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_RELEASE_FOCUS);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: ok.\r\n", __func__);

    return retval;
}

/*
 * If need to do auto focus based on diffent sensor's internal resolution 
 * configuration, this command is needed, because the focus zones 
 * configuration are based on the sensor's internal resolution configuration.
 */
static int ov5640_af_re_launch_focus_zones(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_RE_LAUNCH_FOCUS_ZONES);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: ok.\r\n", __func__);

    return retval;
}

/*
 * The VCM drive current scope(from start current to maxim current) is mapped 
 * to 0 - 255. Thus using this command can realize the manual focus function.
 */
static int ov5640_af_set_vcm_step(u8 step)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_PARA3_REG, 0x00);
    retval |= ov5640_i2c_write(AF_CMD_PARA4_REG, step);
    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_SET_VCM_STEP);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s(%d): failed.\r\n", __func__, step);
    else
        pr_debug("%s(%d): ok.\r\n", __func__, step);

    return retval;
}

/*
 * The command is used to get the current step.
 */
static int ov5640_af_get_vcm_step(u8 *step)
{
    int retval = 0;
    u8 val;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_GET_VCM_STEP);
    retval |= ov5640_af_waiting_for_ack();
    retval |= ov5640_i2c_read(AF_CMD_PARA4_REG, &val);
    if (retval < 0) {
        pr_err("%s: failed.\r\n", __func__);
    } else {
        *step = val;
        pr_debug("%s(%d): ok.\r\n", __func__, val);
    }

    return retval;
}

/*
 * If embedded focus zone configuration is used, this command is used to 
 * re-launch the default focus zone configurations.
 */
static int ov5640_af_re_launch_default_focus_zones(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_RE_LAUNCH_DEFAULT_FOCUS_ZONES);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: ok.\r\n", __func__);

    return retval;
}

/*
 * If touch zone configuration is supported, the command is used to
 * configure the focus zone based on the Virtual View Finder(VVF)
 * coordinate of touch point(Xc, Yc).
 */
static int ov5640_af_launch_touch_mode_focus_zones(u8 xc, u8 yc)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_PARA0_REG, xc);
    retval |= ov5640_i2c_write(AF_CMD_PARA1_REG, yc);
    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_LAUNCH_TOUCH_MODE_FOCUS_ZONES);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s(Xc=%d, Yc=%d): failed.\r\n", __func__, xc, yc);
    else
        pr_debug("%s(Xc=%d, Yc=%d): ok.\r\n", __func__, xc, yc);

    return retval;
}

/*
 * If custom zone mode is supported, this command is used to start
 * configuration the focus zones.
 */
static int ov5640_af_enable_custom_focus_zone_config(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_ENABLE_CUSTOM_FOCUS_ZONE_CONFIG);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: ok.\r\n", __func__);

    return retval;
}

/*
 * If custom zone mode is supported, this command is used to configuration
 * the focus zones based on the Virtual View Finder(VVF) coordinate of
 * zones(Xc, Yc, W, H).
 */
static int ov5640_af_configure_focus_zone(u8 zone, u8 xc, u8 yc, u8 w, u8 h)
{
    int retval = 0;

    if (zone > 4) {
        pr_err("%s(%d): is not supported.\r\n", __func__, zone);
        return -1;
    }

    retval |= ov5640_i2c_write(AF_CMD_PARA0_REG, xc);
    retval |= ov5640_i2c_write(AF_CMD_PARA1_REG, yc);
    retval |= ov5640_i2c_write(AF_CMD_PARA2_REG, w);
    retval |= ov5640_i2c_write(AF_CMD_PARA3_REG, h);
    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_CONFIG_FOCUS_ZONE0 + zone);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s(Zone=%d, Xc=%d, Yc=%d, W=%d, H=%d): failed.\r\n", 
               __func__, zone, xc, yc, w, h);
    else
        pr_debug("%s(Zone=%d, Xc=%d, Yc=%d, W=%d, H=%d): ok.\r\n", 
                 __func__, zone, xc, yc, w, h);

    return retval;
}

/*
 * If custom zone mode is supported, this command is used to launch 
 * the configured the focus zones.
 */
static int ov5640_af_launch_custom_focus_zones(void)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_LAUNCH_CUSTOM_FOCUS_ZONES);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s: failed.\r\n", __func__);
    else
        pr_debug("%s: ok.\r\n", __func__);

    return retval;
}

/*
 * If Multi-Zones mode is supported, this command is used to configure
 * the weight of zones(0x80 is default).
 */
static int ov5640_af_weights_of_focus_zones(u8 wt0, u8 wt1, u8 wt2, u8 wt3, u8 wt4)
{
    int retval = 0;

    retval |= ov5640_i2c_write(AF_CMD_PARA0_REG, wt0);
    retval |= ov5640_i2c_write(AF_CMD_PARA1_REG, wt1);
    retval |= ov5640_i2c_write(AF_CMD_PARA2_REG, wt2);
    retval |= ov5640_i2c_write(AF_CMD_PARA3_REG, wt3);
    retval |= ov5640_i2c_write(AF_CMD_PARA4_REG, wt4);
    retval |= ov5640_i2c_write(AF_CMD_ACK_REG, 0x01);
    retval |= ov5640_i2c_write(AF_CMD_MAIN_REG, AF_WEIGHTS_OF_FOCUS_ZONES);
    retval |= ov5640_af_waiting_for_ack();
    if (retval < 0) 
        pr_err("%s(WT0=%d, WT1=%d, WT2=%d, WT3=%d, WT4=%d): failed.\r\n", 
               __func__, wt0, wt1, wt2, wt3, wt4);
    else
        pr_debug("%s(WT0=%d, WT1=%d, WT2=%d, WT3=%d, WT4=%d): ok.\r\n", 
                 __func__, wt0, wt1, wt2, wt3, wt4);

    return retval;
}

static int ov5640_af_focus_zone_mode (
           enum ov5640_focus_zone_mode mode,
           unsigned char xc, unsigned char yc) 
{
    pr_debug("%s: zone array mode is %d\r\n", 
             __func__, mode);

    switch (mode) {
    // Embedded Zone Configuration
    case EMBEDDED_FIXED_ZONE_MODE:
        break;
    case EMBEDDED_TOUCH_ZONE_MODE:
        break;
    case EMBEDDED_CUSTOM_SINGLE_ZONE_MODE:
        break;
    case EMBEDDED_CUSTOM_MULTI_ZONES_MODE:
        break;
    // External Zone Configuration
    case ETERNAL_SINGLE_ZONE_MODE:
        break;
    case ETERNAL_MULTI_ZONES_MODE:
        break;
    default:
        break;
    }

    return 0;
};

            
static int ov5640_set_para_white_balance(unsigned char val)
{
    int retval = 0;

    switch (val) {
    case WHITE_BALANCE_AUTO:                // Advanced AWB
        return ov5640_i2c_write(0x3406, 0x00);
    case WHITE_BALANCE_INCANDESCENT:        // Manual
        retval |= ov5640_i2c_write(0x3400, 0x04);     // R Gain
        retval |= ov5640_i2c_write(0x3401, 0x58);
        retval |= ov5640_i2c_write(0x3402, 0x04);     // G Gain
        retval |= ov5640_i2c_write(0x3403, 0x00);
        retval |= ov5640_i2c_write(0x3404, 0x08);     // B Gain
        retval |= ov5640_i2c_write(0x3405, 0x40);
        break;
    case WHITE_BALANCE_FLUORESCENT:         // Manual
        retval |= ov5640_i2c_write(0x3400, 0x06);
        retval |= ov5640_i2c_write(0x3401, 0x2a);
        retval |= ov5640_i2c_write(0x3402, 0x04);
        retval |= ov5640_i2c_write(0x3403, 0x00);
        retval |= ov5640_i2c_write(0x3404, 0x07);
        retval |= ov5640_i2c_write(0x3405, 0x24);
        break;
    case WHITE_BALANCE_WARM_FLUORESCENT:     // Manual
        retval |= ov5640_i2c_write(0x3400, 0x07);
        retval |= ov5640_i2c_write(0x3401, 0x2a);
        retval |= ov5640_i2c_write(0x3402, 0x04);
        retval |= ov5640_i2c_write(0x3403, 0x00);
        retval |= ov5640_i2c_write(0x3404, 0x07);
        retval |= ov5640_i2c_write(0x3405, 0x24);
        break;
    case WHITE_BALANCE_DAYLIGHT:            // Manual
        retval |= ov5640_i2c_write(0x3400, 0x07);
        retval |= ov5640_i2c_write(0x3401, 0x02);
        retval |= ov5640_i2c_write(0x3402, 0x04);
        retval |= ov5640_i2c_write(0x3403, 0x00);
        retval |= ov5640_i2c_write(0x3404, 0x05);
        retval |= ov5640_i2c_write(0x3405, 0x15);
        break;
    case WHITE_BALANCE_CLOUDY_DAYLIGHT:     // Manual
        retval |= ov5640_i2c_write(0x3400, 0x07);
        retval |= ov5640_i2c_write(0x3401, 0x88);
        retval |= ov5640_i2c_write(0x3402, 0x04);
        retval |= ov5640_i2c_write(0x3403, 0x00);
        retval |= ov5640_i2c_write(0x3404, 0x05);
        retval |= ov5640_i2c_write(0x3405, 0x00);
        break;
    case WHITE_BALANCE_TWILIGHT:            // Manual
        retval |= ov5640_i2c_write(0x3400, 0x0b);
        retval |= ov5640_i2c_write(0x3401, 0x2a);
        retval |= ov5640_i2c_write(0x3402, 0x05);
        retval |= ov5640_i2c_write(0x3403, 0x00);
        retval |= ov5640_i2c_write(0x3404, 0x07);
        retval |= ov5640_i2c_write(0x3405, 0x24);
        break;
    case WHITE_BALANCE_SHADE:               // Manual
        retval |= ov5640_i2c_write(0x3400, 0x06);
        retval |= ov5640_i2c_write(0x3401, 0x00);
        retval |= ov5640_i2c_write(0x3402, 0x03);
        retval |= ov5640_i2c_write(0x3403, 0x25);
        retval |= ov5640_i2c_write(0x3404, 0x03);
        retval |= ov5640_i2c_write(0x3405, 0xad);
        break;
    default:
        return -1;
   }

    retval |= ov5640_i2c_write(0x3406, 0x01);     // 0x01: manual is enabled

    return retval;
}
static int ov5640_set_para_iso(unsigned char val)
{
    int retval = 0;

    switch(val) {
    case IMAGE_ISO_AUTO:
        retval = ov5640_i2c_write(0x3a19, 0xf8);
        break;
    case IMAGE_ISO_100:
        retval = ov5640_i2c_write(0x3a18, 0x00);
        retval |= ov5640_i2c_write(0x3a19, 0x6c);//0x6c
        break;
    case IMAGE_ISO_200:
        retval = ov5640_i2c_write(0x3a18, 0x00);
        retval |= ov5640_i2c_write(0x3a19, 0x8c);
        break;
    case IMAGE_ISO_400:
        retval = ov5640_i2c_write(0x3a18, 0x00);
        retval |= ov5640_i2c_write(0x3a19, 0xcc);
        break;
    case IMAGE_ISO_800:
        retval = ov5640_i2c_write(0x3a18, 0x00);
        retval |= ov5640_i2c_write(0x3a19, 0xfc);
        break;
    default:
        return -1;
    }

    return retval;
}

static int ov5640_get_firmware_status(u8 *st)
{
    int retval;
    u8 fw_status;

    retval = ov5640_i2c_read(AF_FW_STATUS_REG, &fw_status);
    if (retval < 0) return -1;

    switch (fw_status) {
        case AF_S_FIRWARE:
            pr_debug("%s: Firmware is downloaded and not run.\r\n", __func__);
            break;
        case AF_S_STARTUP:
            pr_debug("%s: Firmware is initializing.\r\n", __func__);
            break;
        case AF_S_IDLE:
            pr_debug("%s: Idle state, focus is released, \
                     lens is located at the furthest position.\r\n", __func__);
            break;
        case AF_S_FOCUSING:
            pr_debug("%s: Auto Focus is running...\r\n", __func__);
            break;
        case AF_S_FOCUSED:
            pr_debug("%s: Auto Focus is completed.\r\n", __func__);
            break;
        default:
            pr_err("%s: Undefined firmware status(0x%02x).\r\n", __func__, fw_status);
            break;
    }

    *st = fw_status;

    return retval;
}

// chip id: 0x5640
static int ov5640_get_para_chip_id(int *val)
{
    int retval = 0;
    u8 idh, idl;

    *val = 0;
    printf("ov5640_get_para_chip_id\n");
    retval |= ov5640_i2c_read(0x300a, &idh);
    retval |= ov5640_i2c_read(0x300b, &idl);
    if (retval < 0) {
        pr_err("%s: failed.\r\n", __func__);
        return -1;
    } else {
        *val = (idh << 8) | idl;
        pr_debug("%s: chip id is 0x%04x\r\n", __func__, *val);
    }

    return 0;
}

// for power on initialization
static int ov5640_init_power_on(void)
{
    struct reg_value *preg;
    u32 size;
    int retval;

    // software reset
    retval = ov5640_i2c_write(0x3103, 0x11);
    retval |= ov5640_i2c_write(0x3008, 0x82);
    if (retval < 0) return -1;
    msleep(10);

    preg = (struct reg_value *)ov5640_setting_init_power_on;
    size = ARRAY_SIZE(ov5640_setting_init_power_on);
    retval = ov5640_i2c_burst_write(preg, size);
    if (retval < 0) {
        pr_err("%s: failed\r\n",  __func__);
    } else {
        pr_debug("%s: ok!\r\n", __func__);
    }

    return retval;
}

// for auto focus
static int ov5640_init_embedded_firmware(void)
{
    struct reg_value *preg;
    u32 size;
    int retval = 0;
    printf("start ov5640_init_embedded_firmware \n");
    preg = (struct reg_value *)ov5640_setting_init_embedded_firmware;
    size = ARRAY_SIZE(ov5640_setting_init_embedded_firmware);
 //   preg = (struct reg_value *)ov5640_setting_init_embedded_firmware;
 //   size = ARRAY_SIZE(ov5640_setting_init_embedded_firmware);
    retval = ov5640_i2c_burst_write(preg, size);
    if (retval < 0) {
        pr_err("%s: failed\r\n",  __func__);
    } else {
        pr_debug("%s: ok!\r\n", __func__);
    }

    return retval;
}


/* ---------- Sensor setting for preview and capture ---------- */

static int ov5640_setting_preview_frame_rate(u8 preview_fps)
{
    int retval = 0;
    
    if (preview_fps == 30) {
        retval |= ov5640_i2c_write(0x3035, 0x11);
        retval |= ov5640_i2c_write(0x3036, 0x69);
    } else if (preview_fps == 15) {
        retval |= ov5640_i2c_write(0x3035, 0x21);
        retval |= ov5640_i2c_write(0x3036, 0x46);
    } else {
        pr_err("%s(%d): not supported.\r\n", __func__, preview_fps);
        return -1;
    }

    pr_debug("%s(%d): %s\r\n", __func__, preview_fps, retval ? "failed" : "ok");

    return retval;
}

static int ov5640_setting_auto_exposure(u8 on)
{
    if (on) // enable auto exposure for preview
        return ov5640_i2c_write(0x3503, 0x00);
    else    // disable auto exposure for capture
        return ov5640_i2c_write(0x3503, 0x07);
}

u8 Photo_Mode = 0;
static int ov5640_setting_capture(u8 preview_fps)
{
    u8 val, gain, light_frequency;
    u32 preview_exposure, preview_maxlines;
    u32 capture_exposure, capture_maxlines;
    u32 lines_10ms, temp;
    u32 capture_gain, capture_exposure_gain;

    u32 size;
    int retval = 0;
    struct reg_value *preg;
    enum ov5640_mode mode = ov5640_data.streamcap.capturemode;//Photo_Mode;;//

    if (mode > ov5640_mode_MAX) {
        pr_err("%s: invalid capture mode(%d)\r\n", __func__, mode);
        return -1;
    }

    // stop auto exposure
    retval = ov5640_setting_auto_exposure(0);
    
    // read preview register value
    retval |= ov5640_i2c_read(0x350b, &gain);
    pr_debug("%s: gain = 0x%02x\r\n", __func__, gain);
    
    retval |= ov5640_i2c_read(0x3500, &val);
    preview_exposure = val;
    preview_exposure <<= 8;
    retval |= ov5640_i2c_read(0x3501, &val);
    preview_exposure += val;
    preview_exposure <<= 4;
    retval |= ov5640_i2c_read(0x3502, &val);
    preview_exposure += val >> 4;
    pr_debug("%s: preview_exposure = 0x%05x\r\n", __func__, preview_exposure);
    
    #if 0
    retval |= ov5640_i2c_read(0x380e, &val);
    preview_maxlines = val;
    preview_maxlines <<= 8;
    retval |= ov5640_i2c_read(0x380f, &val);
    preview_maxlines += val;
    #else
    preview_maxlines = 0x03d8;  // from the table ov5640_setting_capture_to_preview
    #endif
    pr_debug("%s: preview_maxlines = 0x%04x\r\n", __func__, preview_maxlines);
    
    retval |= ov5640_i2c_read(0x3c01, &val);
    if (val & 0x80) {   // manual
        retval |= ov5640_i2c_read(0x3c00, &light_frequency);
        light_frequency >>= 2;
    } else {            // auto
        retval |= ov5640_i2c_read(0x3c0c, &light_frequency);
    }
    light_frequency &= 0x01;    // 0: 60hz, 1: 50hz
    pr_debug("%s: light_frequency = 0x%02x\r\n", __func__, light_frequency);
    
    retval |= ov5640_i2c_read(0x56a1, &val);
    ov5640_data.preview_brightness = val;
    if (((ov5640_data.flash_mode == FLASH_MODE_AUTO) && (val < 0x20))
        || (ov5640_data.flash_mode == FLASH_MODE_ON)) {
        gain = (gain > val) ? (gain - val) : 0;
    }
    pr_debug("%s: preview_brightness = 0x%02x\r\n", __func__, val);
    
    if (retval < 0) {
        pr_err("%s(error): failed to read preview register value.\r\n", __func__);
        goto __exit0;
    }
  
    // change resolution for capture
    preg = (struct reg_value *)ov5640_setting_preview_to_capture;
    size = ARRAY_SIZE(ov5640_setting_preview_to_capture);
    retval = ov5640_i2c_burst_write(preg, size);
    retval |= ov5640_init_mode(mode);
    if (retval < 0) {
        pr_err("%s(error): failed to change resolution for capture.\r\n", __func__);
        goto __exit0;
    }
     
    #if 0
    // read capture register value
    //msleep(5);
    retval = ov5640_i2c_read(0x380e, &val);
    capture_maxlines = val;
    capture_maxlines <<= 8;
    retval |= ov5640_i2c_read(0x380f, &val);
    capture_maxlines += val;
    if ((retval < 0) || (capture_maxlines == 0)) {
        pr_err("%s(error): capture_maxlines = %d\r\n", __func__, capture_maxlines);
        goto __exit1;
    }
    #else
    capture_maxlines = 0x07b0;  // from the table ov5640_setting_preview_to_capture
    #endif
    pr_debug("%s: capture_maxlines = 0x%04x\r\n", __func__, capture_maxlines);

    // calculate banding filter value
    if (!light_frequency) {     // 60hz
        temp = 12000;
    } else {                    // 50hz
        temp = 10000;
    }
    lines_10ms = ((CAPTURE_FRAME_RATE * capture_maxlines) / temp) * 13 / 12;
    pr_debug("%s: lines_10ms = 0x%04x\r\n", __func__, lines_10ms);

    if (!preview_maxlines || !preview_fps || !lines_10ms) {
        pr_err("%s(error): preview_maxlines(0x%04x), preview_fps(0x%02x), "
               "lines_10ms(0x%04x).\r\n", __func__, preview_maxlines, preview_fps, 
               lines_10ms);
        goto __exit1;
    }
    
    // calculate capture exposure and gain.
    capture_exposure = preview_exposure;
    capture_exposure *= (capture_maxlines * CAPTURE_FRAME_RATE) / 100;
    capture_exposure /= preview_maxlines * preview_fps;
    capture_exposure = capture_exposure * 6 / 5;
    capture_gain = gain;
    capture_exposure_gain = capture_exposure * capture_gain;
    if (ov5640_data.scene_mode == SCENE_MODE_NIGHT) capture_exposure_gain <<= 1;

    if (capture_exposure_gain < (capture_maxlines << 4)) {
        capture_exposure = capture_exposure_gain >> 4;
        if (capture_exposure > lines_10ms) {
            capture_exposure /= lines_10ms;
            capture_exposure *= lines_10ms;
        }
    } else {
        capture_exposure = capture_maxlines;
    }
    if (capture_exposure == 0) capture_exposure = 1;
    pr_debug("%s: capture_exposure = 0x%05x\r\n", __func__, capture_exposure);

    capture_gain = (((capture_exposure_gain << 1) / capture_exposure) + 1) >> 1;
    pr_debug("%s: capture_gain = 0x%02x\r\n", __func__, capture_gain);

    // write back the gain and exposure value
    gain = capture_gain & 0xff;
    retval = ov5640_i2c_write(0x350b, gain);
    val = capture_exposure & 0x0f;
    val <<= 4;
    retval |= ov5640_i2c_write(0x3502, val);
    capture_exposure >>= 4;
    val = capture_exposure & 0xff;
    retval |= ov5640_i2c_write(0x3501, val);
    capture_exposure >>= 8;
    val = capture_exposure & 0x0f;
    retval |= ov5640_i2c_write(0x3500, val);
    if (retval >= 0) goto __exit0; 
    
    pr_err("%s: failed to write back the gain and exposure value.\r\n", __func__);
    
__exit1:
    // We will get a picture of no exposure, but the CAMERA AP doesn't stopped.
    retval = 0;
__exit0:
    pr_debug("%s(mode=%d): %s.\r\n", __func__, mode, retval ? "failed" : "ok");     
    return retval;
}

/* --------------- ov5640 init setting --------------- */

// for specific fps and resolution
 int ov5640_init_mode(enum ov5640_mode mode)
{
    struct ov5640_mode_info *pinfo_data;
    struct reg_value *preg;
    u32 size;
    int retval;

    if (mode > ov5640_mode_MAX) {
        pr_err("%s: invalid mode(%d)\r\n", __func__, mode);
        return -1;
    }

    pinfo_data = &ov5640_mode_info_data[mode];

    ov5640_data.pix.width  = pinfo_data->width;
    ov5640_data.pix.height = pinfo_data->height;
    preg = pinfo_data->init_data_ptr;
    size = pinfo_data->init_data_size;
    retval = ov5640_i2c_burst_write(preg, size);
    if (retval < 0) {
        pr_err("%s(%d): failed\r\n",  __func__, mode);
    } else {
        pr_debug("%s(%d): ok!\r\n", __func__, mode);
    }

    return retval;
}
static int ov5640_setting_preview(u8 preview_fps)
{
    int retval;
    u32 size;
    struct reg_value *preg;
    enum ov5640_mode mode = ov5640_mode_SXGA_1280_960;//ov5640_data.streamcap.capturemode;

    if (mode > ov5640_mode_XGA_1024_768) {
        pr_err("%s: invalid preview mode(%d)\r\n", __func__, mode);
        return -1;
    }

    ov5640_af_release_focus();
    
    preg = (struct reg_value *) ov5640_setting_capture_to_preview;
    size = ARRAY_SIZE(ov5640_setting_capture_to_preview); 
    retval = ov5640_setting_auto_exposure(1);
    retval |= ov5640_i2c_burst_write(preg, size);
    retval |= ov5640_init_mode(mode);
    retval |= ov5640_setting_preview_frame_rate(preview_fps);

    pr_debug("%s(mode=%d): %s.\r\n", __func__, mode, retval ? "failed" : "ok");

    return retval;
}

static int ov5640_set_para_exposurelevel(unsigned char val)
{
    int retval = 0;

    switch (val) {
    case EXPOSURELEVEL_N1_7EV:  // -1.7EV
        retval |= ov5640_i2c_write(0x3a0f, 0x10);
        retval |= ov5640_i2c_write(0x3a10, 0x08);
        retval |= ov5640_i2c_write(0x3a1b, 0x10);
        retval |= ov5640_i2c_write(0x3a1e, 0x08);
        retval |= ov5640_i2c_write(0x3a11, 0x20);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_N1_3EV:  // -1.3EV
        retval |= ov5640_i2c_write(0x3a0f, 0x18);
        retval |= ov5640_i2c_write(0x3a10, 0x10);
        retval |= ov5640_i2c_write(0x3a1b, 0x18);
        retval |= ov5640_i2c_write(0x3a1e, 0x10);
        retval |= ov5640_i2c_write(0x3a11, 0x30);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_N1_0EV:  // -1.0EV
        retval |= ov5640_i2c_write(0x3a0f, 0x20);
        retval |= ov5640_i2c_write(0x3a10, 0x18);
        retval |= ov5640_i2c_write(0x3a11, 0x41);
        retval |= ov5640_i2c_write(0x3a1b, 0x20);
        retval |= ov5640_i2c_write(0x3a1e, 0x18);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_N0_7EV:  // -0.7EV
        retval |= ov5640_i2c_write(0x3a0f, 0x28);
        retval |= ov5640_i2c_write(0x3a10, 0x20);
        retval |= ov5640_i2c_write(0x3a11, 0x51);
        retval |= ov5640_i2c_write(0x3a1b, 0x28);
        retval |= ov5640_i2c_write(0x3a1e, 0x20);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_N0_3EV:  // -0.3EV
        retval |= ov5640_i2c_write(0x3a0f, 0x30);
        retval |= ov5640_i2c_write(0x3a10, 0x28);
        retval |= ov5640_i2c_write(0x3a11, 0x61);
        retval |= ov5640_i2c_write(0x3a1b, 0x30);
        retval |= ov5640_i2c_write(0x3a1e, 0x28);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_P0_0EV:  // default
        retval |= ov5640_i2c_write(0x3a0f, 0x38);
        retval |= ov5640_i2c_write(0x3a10, 0x30);
        retval |= ov5640_i2c_write(0x3a11, 0x61);
        retval |= ov5640_i2c_write(0x3a1b, 0x38);
        retval |= ov5640_i2c_write(0x3a1e, 0x30);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_P0_3EV:  // +0.3EV
        retval |= ov5640_i2c_write(0x3a0f, 0x40);
        retval |= ov5640_i2c_write(0x3a10, 0x38);
        retval |= ov5640_i2c_write(0x3a11, 0x71);
        retval |= ov5640_i2c_write(0x3a1b, 0x40);
        retval |= ov5640_i2c_write(0x3a1e, 0x38);
        retval |= ov5640_i2c_write(0x3a1f, 0x10);
        break;
    case EXPOSURELEVEL_P0_7EV:  // +0.7EV
        retval |= ov5640_i2c_write(0x3a0f, 0x48);
        retval |= ov5640_i2c_write(0x3a10, 0x40);
        retval |= ov5640_i2c_write(0x3a11, 0x80);
        retval |= ov5640_i2c_write(0x3a1b, 0x48);
        retval |= ov5640_i2c_write(0x3a1e, 0x40);
        retval |= ov5640_i2c_write(0x3a1f, 0x20);
        break;
    case EXPOSURELEVEL_P1_0EV:  // +1.0EV
        retval |= ov5640_i2c_write(0x3a0f, 0x50);
        retval |= ov5640_i2c_write(0x3a10, 0x48);
        retval |= ov5640_i2c_write(0x3a11, 0x90);
        retval |= ov5640_i2c_write(0x3a1b, 0x50);
        retval |= ov5640_i2c_write(0x3a1e, 0x48);
        retval |= ov5640_i2c_write(0x3a1f, 0x20);
        break;
    case EXPOSURELEVEL_P1_3EV:  // +1.3EV
        retval |= ov5640_i2c_write(0x3a0f, 0x58);
        retval |= ov5640_i2c_write(0x3a10, 0x50);
        retval |= ov5640_i2c_write(0x3a11, 0x91);
        retval |= ov5640_i2c_write(0x3a1b, 0x58);
        retval |= ov5640_i2c_write(0x3a1e, 0x50);
        retval |= ov5640_i2c_write(0x3a1f, 0x20);
        break;
    case EXPOSURELEVEL_P1_7EV:  // +1.7EV
        retval |= ov5640_i2c_write(0x3a0f, 0x60);
        retval |= ov5640_i2c_write(0x3a10, 0x58);
        retval |= ov5640_i2c_write(0x3a11, 0xa0);
        retval |= ov5640_i2c_write(0x3a1b, 0x60);
        retval |= ov5640_i2c_write(0x3a1e, 0x58);
        retval |= ov5640_i2c_write(0x3a1f, 0x20);
        break;
    default:
        return -1;
    }

    return retval;
}

static int ov5640_power_on(void)
{
    int retval = 0;

    // step1: RESET is applied to ov5640 camera module. PWDN is pulled high.
//手工注释
//  if (ov5640_data.platform_data->reset) 
//        ov5640_data.platform_data->reset(0);
//    if (ov5640_data.platform_data->pwdn)
//        ov5640_data.platform_data->pwdn(1);

    //step2: DOVDD and AVDD powers are applied. 
    //The 2 powers could be applied simultaneously.
    //If applied separately, 
    //the power on sequence should be DOVDD first, and AVDD last.

    //step3: after 5ms of AVDD reaching stable, pull PWDN to low.
//手工注释
//    msleep(5);
//    if (ov5640_data.platform_data->pwdn)
//        ov5640_data.platform_data->pwdn(0);
    
    //step4: after 1ms of PWDN go low, pull high RESET.
//手工注释
//    msleep(2);
//    if (ov5640_data.platform_data->reset)
//        ov5640_data.platform_data->reset(1);

    //step5: after 20ms, initialize ov5640 by SCCB initialization.
    msleep(22);
    retval = ov5640_init_power_on();
    if (retval >= 0) {
        msleep(10);
        retval = ov5640_init_embedded_firmware();
    }

    //step6: pull high PWDN, set ov5640 to power down mode.
    //msleep(1);
    //if (ov5640_data.platform_data->pwdn)
    //    ov5640_data.platform_data->pwdn(1);

    //step7: pull XCLK low. 

    return retval;
}


static int ov5640_set_para_auto_focus(void)
{
    int retval;
    u8 i, af_status;
    
    switch (ov5640_data.af_mode) {
    case FOCUS_MODE_AUTO:
        retval = ov5640_af_continue_auto_focus();//ov5640_af_trig_single_auto_focus();
        break;
    case FOCUS_MODE_INFINITY:
        retval = ov5640_af_set_vcm_step(0);
        break;
    case FOCUS_MODE_MACRO:
        retval = ov5640_af_set_vcm_step(255);
        break;
     default:
        pr_err("%s: error af mode(%d)\r\n", __func__, ov5640_data.af_mode);
        return -1;
    }
    
    if (retval >= 0) {
        for (i=0; i<20; i++) {
            msleep(50);
            retval = ov5640_get_firmware_status(&af_status);
            if (retval < 0) return -1;
            if (af_status == AF_S_FOCUSING) 
                continue;
            else if (af_status == AF_S_FOCUSED) 
                return 0;
            else
                break;
        }
    }
    
    return -1;
}
static int ov5640_set_para_antibanding(unsigned char val)
{
    int retval = 0;

    switch (val) {
    case ANTIBANDING_AUTO:
        retval = ov5640_i2c_write(0x3622, 0x01);
        retval |= ov5640_i2c_write(0x3635, 0x1c);      
        retval |= ov5640_i2c_write(0x3634, 0x40);
        retval |= ov5640_i2c_write(0x3c01, 0x34);
        retval |= ov5640_i2c_write(0x3c00, 0x00);
        retval |= ov5640_i2c_write(0x3c04, 0x28);
        retval |= ov5640_i2c_write(0x3c05, 0x98);
        retval |= ov5640_i2c_write(0x3c06, 0x00);
        retval |= ov5640_i2c_write(0x3c07, 0x08);
        retval |= ov5640_i2c_write(0x3c08, 0x00);
        retval |= ov5640_i2c_write(0x3c09, 0x1c);
        retval |= ov5640_i2c_write(0x300c, 0x22);
        retval |= ov5640_i2c_write(0x3c0a, 0x9c);
        retval |= ov5640_i2c_write(0x3c0b, 0x40);
        break;
    case ANTIBANDING_50HZ:
        retval = ov5640_i2c_write(0x3c01, 0x80);
        retval |= ov5640_i2c_write(0x3c00, 0x04);
        break;
    case ANTIBANDING_60HZ:
        retval = ov5640_i2c_write(0x3c01, 0x80);
        retval |= ov5640_i2c_write(0x3c00, 0x00);
        break;
    case ANTIBANDINT_OFF:
        break;
    default:
        return -1;
    }

    return retval;
}
static int ov5640_probe(void)
{
   

    /* Set initial values for the sensor struct. */
    memset(&ov5640_data, 0, sizeof(ov5640_data));

    ov5640_data.af_mode = FOCUS_MODE_AUTO;
    ov5640_data.zoom_level = 0;

    return 0;
}

static int ov5640_set_para_test_pattern(unsigned char val)
{
    int retval = 0;

    switch (val) {
    case TEST_PATTERN_OFF:
        retval = ov5640_i2c_write(0x503d, 0x00);
        break;
    case TEST_PATTERN_COLOR_BAR:
        retval = ov5640_i2c_write(0x503d, 0x80);
        break;
    case TEST_PATTERN_RANDOM_DATA:
        retval = ov5640_i2c_write(0x503d, 0x81);
        break;
    case TEST_PATTERN_SQUARE_DATA:
        retval = ov5640_i2c_write(0x503d, 0x82);
        break;
    case TEST_PATTERN_BLACK_IMAGE:
        retval = ov5640_i2c_write(0x503d, 0x83);
        break;
    default:
        return -1;
    }

    retval |= ov5640_i2c_write(0x4741, 0x00);

    return retval;
}

static int ov5640_set_para_scene_mode(unsigned char val)
{
    int retval = 0;

    switch (val) {
    case SCENE_MODE_AUTO:
        retval |= ov5640_i2c_write(0x3a00, 0x78);
        retval |= ov5640_i2c_write(0x3a05, 0x30);
        retval |= ov5640_i2c_write(0x3a14, 0x03);
        retval |= ov5640_i2c_write(0x3a15, 0xd8);
        retval |= ov5640_i2c_write(0x3a02, 0x03);
        retval |= ov5640_i2c_write(0x3a03, 0xd8);
        break;
    case SCENE_MODE_NIGHT:
        retval |= ov5640_i2c_write(0x3a00, 0x6c);
        retval |= ov5640_i2c_write(0x3a05, 0x70);
        retval |= ov5640_i2c_write(0x3a14, 0x07);
        retval |= ov5640_i2c_write(0x3a15, 0xd0);
        retval |= ov5640_i2c_write(0x3a02, 0x07);
        retval |= ov5640_i2c_write(0x3a03, 0xb0);
        break;
    default:
        return -1;
    }

    return retval;
}

void AutoFocus(u8 focus_mode)
{
   
    ov5640_data.af_mode = focus_mode;
    while(ov5640_set_para_auto_focus() < 0)
    {
      ;
    }
}
void    JPEG_5MP(void)
{
    // JPEG, 2592x1944 fixed size, 15fps
    // Input clock = 24Mhz, PCLK = 42 MHz
    wrOV5640Reg(0x3035, 0x11); // PLL 
    wrOV5640Reg(0x3036, 0x69); // PLL 
    wrOV5640Reg(0x3c07, 0x07); // lightmeter 1 threshold[7:0] 
    wrOV5640Reg(0x3820, 0x40); // flip
    wrOV5640Reg(0x3821, 0x26); // mirror 
    wrOV5640Reg(0x3814, 0x11); // timing X inc 
    wrOV5640Reg(0x3815, 0x11); // timing Y inc 
    wrOV5640Reg(0x3800, 0x00); // HS 
    wrOV5640Reg(0x3801, 0x00); // HS 
    wrOV5640Reg(0x3802, 0x00); // VS 
    wrOV5640Reg(0x3803, 0x00); // VS 
    wrOV5640Reg(0x3804, 0x0a); // HW (HE)
    wrOV5640Reg(0x3805, 0x3f); // HW (HE)
    wrOV5640Reg(0x3806, 0x07); // VH (VE)
    wrOV5640Reg(0x3807, 0x9f); // VH (VE)
    wrOV5640Reg(0x3808, 0x0a); // DVPHO 
    wrOV5640Reg(0x3809, 0x20); // DVPHO 
    wrOV5640Reg(0x380a, 0x07); // DVPVO 
    wrOV5640Reg(0x380b, 0x98); // DVPVO 
    wrOV5640Reg(0x380c, 0x0b); // HTS 
    wrOV5640Reg(0x380d, 0x1c); // HTS 
    wrOV5640Reg(0x380e, 0x07); // VTS 
    wrOV5640Reg(0x380f, 0xb0); // VTS 
    wrOV5640Reg(0x3813, 0x04); // timing V offset 
    /*
    wrOV5640Reg(0x3820, 0x43), // Flip
    wrOV5640Reg(0x3821, 0x05), // Mirror
    */
    wrOV5640Reg(0x3618, 0x04);
    wrOV5640Reg(0x3612, 0x2b);
    wrOV5640Reg(0x3709, 0x12);
    wrOV5640Reg(0x370c, 0x00);
    ///banding filters are calculated automatically in camera driver
    //wrOV5640Reg(0x3a02, 0x07); // 60Hz max exposure 
    //wrOV5640Reg(0x3a03, 0xae); // 60Hz max exposure 
    //wrOV5640Reg(0x3a08, 0x01); // B50 step 
    //wrOV5640Reg(0x3a09, 0x27); // B50 step 
    //wrOV5640Reg(0x3a0a, 0x00); // B60 step 
    //wrOV5640Reg(0x3a0b, 0xf6); // B60 step 
    //wrOV5640Reg(0x3a0e, 0x06); // 50Hz max band
    //wrOV5640Reg(0x3a0d, 0x08); // 60Hz max band
    //wrOV5640Reg(0x3a14, 0x07); // 50Hz max exposure 
    //wrOV5640Reg(0x3a15, 0xae); // 50Hz max exposure 
    
    wrOV5640Reg(0x4300, 0x31);//YUV422格式选择
    wrOV5640Reg(0x501f, 0x00);
    

    wrOV5640Reg(0x4004, 0x06); // BLC line number 
    wrOV5640Reg(0x3002, 0x00); // reset JFIFO, SFIFO, JPG 
    wrOV5640Reg(0x3006, 0xff); // disable clock of JPEG2x, JPEG
    wrOV5640Reg(0x4713, 0x02); // JPEG mode 2
    wrOV5640Reg(0x4407, 0x04); // Quantization sacle 
    wrOV5640Reg(0x460b, 0x35);
    wrOV5640Reg(0x460c, 0x22);
    wrOV5640Reg(0x4837, 0x16); // MIPI global timing 
    wrOV5640Reg(0x3824, 0x04); // PCLK manual divider
    wrOV5640Reg(0x5001, 0x83); // SDE on, CMX on, AWB on
    wrOV5640Reg(0x3503, 0x03);


    wrOV5640Reg(0x3406, 0x00);//环境光模式
    wrOV5640Reg(0x3400, 0x04);
    wrOV5640Reg(0x3401, 0x00);
    wrOV5640Reg(0x3402, 0x04);
    wrOV5640Reg(0x3403, 0x00);
    wrOV5640Reg(0x3404, 0x04);
    wrOV5640Reg(0x3405, 0x00);
    wrOV5640Reg(0x3212, 0x13); // end group 3
    wrOV5640Reg(0x3212, 0xa3); // lanuch group 3
}
u8 OV5640_init(void)
{
    int ov_id = 0;
    printf("OV5640_init Begin!\n");
    ov5640_probe();
    printf("OV5640_probe Done!\n");
    if(ov5640_get_para_chip_id(&ov_id) < 0)
    {
	return -1;
    }   

    printf("ov5640_get_para_chip_id Done!\n");

    ov5640_power_on();

    printf("ov5640_power_on Done!\n");
    ov5640_setting_preview(30);//帧率
    printf("ov5640_setting_preview Done!\n");
    AutoFocus(FOCUS_MODE_AUTO);
   // ov5640_setting_capture(30);
    printf("ov5640_setting_preview Done!\n");
    ov5640_setting_auto_exposure(1);
    ov5640_set_para_iso(IMAGE_ISO_AUTO);
    printf("ov5640_set_para_iso!\n");
    ov5640_set_para_antibanding(ANTIBANDING_50HZ);
    //ov5640_set_para_scene_mode(SCENE_MODE_NIGHT);
    ov5640_set_para_exposurelevel(EXPOSURELEVEL_P0_0EV);
    printf("ov5640_set_para_exposurelevel!\n");
    ov5640_set_para_white_balance(WHITE_BALANCE_AUTO);
    //ov5640_set_para_test_pattern(TEST_PATTERN_COLOR_BAR);
    printf("ov5640_set_para_white_balance!\n");
    ov5640_init_mode(ov5640_mode_SXGA_1280_960);
    //ov5640_init_mode(ov5640_mode_VGA_640_480);

    return 0;
}

u8 OV5640_Free_Running(void)
{
    wrOV5640Reg(0x4300, 0x03);//RGB格式选择
    wrOV5640Reg(0x501f, 0x02);
    //ov5640_setting_capture(30);
    ov5640_setting_preview(30);
    ov5640_setting_auto_exposure(1);
    //ov5640_set_para_iso(IMAGE_ISO_AUTO);
    //ov5640_set_para_antibanding(ANTIBANDING_50HZ);
    //ov5640_set_para_scene_mode(SCENE_MODE_NIGHT);
   // ov5640_set_para_exposurelevel(EXPOSURELEVEL_P0_0EV);
    //ov5640_set_para_white_balance(WHITE_BALANCE_AUTO);
    ov5640_init_mode(ov5640_mode_SXGA_1280_960);
    return 0;
}




