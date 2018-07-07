#!/bin/sh

set -e

LINARO_GCC_VER=7.3.1-2018.05
LINARO_GCC_MAJOR_VER=latest-7
HOSTARCH=$(uname -m)

wget -O arm-linux-gnueabi.tar.xz https://releases.linaro.org/components/toolchain/binaries/$LINARO_GCC_MAJOR_VER/arm-linux-gnueabi/gcc-linaro-$LINARO_GCC_VER-${HOSTARCH}_arm-linux-gnueabi.tar.xz
wget -O aarch64-linux-gnu.tar.xz http://releases.linaro.org/components/toolchain/binaries/$LINARO_GCC_MAJOR_VER/aarch64-linux-gnu/gcc-linaro-$LINARO_GCC_VER-${HOSTARCH}_aarch64-linux-gnu.tar.xz

mkdir -p arm-linux-gnueabi
cd arm-linux-gnueabi
tar --strip-components 1 -xvf ../arm-linux-gnueabi.tar.xz
cd ..

mkdir -p aarch64-linux-gnu
cd aarch64-linux-gnu
tar --strip-components 1 -xvf ../aarch64-linux-gnu.tar.xz
cd ..
