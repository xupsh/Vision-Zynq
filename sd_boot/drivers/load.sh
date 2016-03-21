#!/bin/sh
rmmod xilinx_scaler xilinx_axi_video videobuf2_dma_contig videobuf2_memops videobuf2_core xilinx_vdma
insmod xilinx_vdma.ko
insmod videobuf2-core.ko
insmod videobuf2-memops.ko 
insmod videobuf2-dma-contig.ko 
insmod xilinx-axi-video.ko 
insmod xilinx-scaler.ko
