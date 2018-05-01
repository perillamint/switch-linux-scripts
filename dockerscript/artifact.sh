#!/bin/bash

cp -f linux/arch/arm64/boot/Image.gz /var/lib/workresult/
cp -f linux/arch/arm64/boot/dts/nvidia/tegra210-nintendo-switch.dtb /var/lib/workresult/
cp -f shofel2/usb_loader/switch.scr.img /var/lib/workresult/
