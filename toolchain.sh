#!/bin/sh
LINARO_GCC_VER=7.2.1-2017.11

wget -O arm-linux-gnueabi.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/gcc-linaro-$LINARO_GCC_VER-x86_64_arm-linux-gnueabi.tar.xz
wget -O aarch64-linux-gnu.tar.xz http://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/aarch64-linux-gnu/gcc-linaro-$LINARO_GCC_VER-x86_64_aarch64-linux-gnu.tar.xz

mkdir -p arm-linux-gnueabi
cd arm-linux-gnueabi
tar --strip-components 1 -xvf ../arm-linux-gnueabi.tar.xz
cd ..

mkdir -p aarch64-linux-gnu
cd aarch64-linux-gnu
tar --strip-components 1 -xvf ../aarch64-linux-gnu.tar.xz
cd ..
