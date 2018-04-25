#!/bin/bash
pushd shofel2/exploit
./shofel2.py cbfs.bin ../../coreboot/build/coreboot.rom
popd

# Wait for coreboot spins up...
sleep 3

cd shofel2/usb_loader
../../imx_usb_loader/imx_usb -c .
