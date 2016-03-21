/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description:  ov5640
 *
 *        Version:  1.0
 *        Created:  08/18/2015 10:02:02 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Jiang JiaJi (@.@), jialij@xilinx.com
 *        Company:  Xilinx XUP
 *
 * =====================================================================================
 */

#include <stdio.h>
#include <string.h>
#include "OV5640.h"

#define DEVICE_NAME         "/dev/i2c-1"
#define DEVICE_ADDR	0x78>>1
xil_i2c *eeprom;





int main()
{
    int i;
    eeprom = XilI2CCreate(DEVICE_NAME, DEVICE_ADDR);
	
    OV5640_init();

    XilI2CDestroy(eeprom);
    return 0;
}
