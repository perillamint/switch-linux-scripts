#!/bin/bash

echo "Please put your Nintendo Switch in Tegra RCM mode."
pushd shofel2/exploit
./shofel2.py ../../docker-result/cbfs.bin ../../coreboot/build/coreboot.rom
popd

# Wait for coreboot spins up...
sleep 3

cd usb_loader
../imx_usb_loader/imx_usb -c .
