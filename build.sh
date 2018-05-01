#!/bin/bash

set -e
export PATH=$(pwd)/arm-linux-gnueabi/bin:$PATH
export PATH=$(pwd)/aarch64-linux-gnu/bin:$PATH
NPROC=$(nproc --all)

pushd shofel2/exploit
make -j$NPROC
popd

pushd u-boot
export CROSS_COMPILE=aarch64-linux-gnu-
make nintendo-switch_defconfig
make -j$NPROC
popd

pushd coreboot
make nintendo_switch_defconfig
make iasl
make
popd

pushd imx_usb_loader
make -j$NPROC
popd

pushd linux
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
make nintendo-switch_defconfig
make -j$NPROC
popd
