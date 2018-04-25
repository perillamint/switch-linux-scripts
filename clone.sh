#!/bin/bash
git clone https://github.com/fail0verflow/shofel2.git
git clone --recursive https://github.com/fail0verflow/switch-coreboot.git coreboot
git clone https://github.com/fail0verflow/switch-u-boot.git u-boot
git clone https://github.com/fail0verflow/switch-linux.git linux
git clone https://github.com/boundarydevices/imx_usb_loader.git

wget -O arm-linux-gnueabi.tar.xz https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi.tar.xz

mkdir -p arm-linux-gnueabi
cd arm-linux-gnueabi
tar tar --strip-components 1 -xvf ../arm-linux-gnueabi.tar.xz
cd ..

cd imx_usb_loader
git reset --hard 0a322b01cacf03e3be727e3e4c3d46d69f2e343e
cd ..

cd coreboot
curl https://gist.githubusercontent.com/perillamint/481beca39ba82ff45dbe1b2dca86c673/raw/8cf20a067ba38e1e1cb9adf64f4bd28b440be3eb/tegra_mtc.bin.b64 | base64 -d > tegra_mtc.bin
cd ..
