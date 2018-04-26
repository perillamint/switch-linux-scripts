#!/bin/bash
git clone https://github.com/fail0verflow/shofel2.git
git clone --recursive https://github.com/fail0verflow/switch-coreboot.git coreboot
git clone https://github.com/fail0verflow/switch-u-boot.git u-boot
git clone https://github.com/fail0verflow/switch-linux.git linux
git clone https://github.com/boundarydevices/imx_usb_loader.git

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

cd imx_usb_loader
git reset --hard 0a322b01cacf03e3be727e3e4c3d46d69f2e343e
cd ..

cd coreboot
set -e
curl https://gist.githubusercontent.com/perillamint/481beca39ba82ff45dbe1b2dca86c673/raw/8cf20a067ba38e1e1cb9adf64f4bd28b440be3eb/tegra_mtc.bin.b64 | base64 -d > tegra_mtc.bin
# You can verify this hash on https://fail0verflow.com/blog/2018/shofel2/
echo "edb32e3f9ed15b55e780e8a01ef927a3b8a1f25b34a6f95467041d8953777d21 tegra_mtc.bin" | sha256sum -c -
set +e
cd ..
