#!/bin/bash

cd shofel2/usb_loader
../../u-boot/tools/mkimage -A arm64 -T script -C none -n "boot.scr" -d switch.scr switch.scr.img
