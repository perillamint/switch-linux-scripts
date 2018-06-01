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

## !! WARNING: INCLUDING PROPRIETARY BT FIRMWARE !!
cat .config  | sed 's#CONFIG_EXTRA_FIRMWARE=.*#CONFIG_EXTRA_FIRMWARE="nvidia/gm20b/pmu/desc.bin nvidia/gm20b/pmu/sig.bin nvidia/gm20b/pmu/image.bin nvidia/gm20b/acr/bl.bin nvidia/gm20b/acr/ucode_load.bin nvidia/gm20b/gr/sw_method_init.bin nvidia/gm20b/gr/gpccs_inst.bin nvidia/gm20b/gr/fecs_bl.bin nvidia/gm20b/gr/sw_bundle_init.bin nvidia/gm20b/gr/fecs_inst.bin nvidia/gm20b/gr/sw_ctx.bin nvidia/gm20b/gr/fecs_data.bin nvidia/gm20b/gr/gpccs_data.bin nvidia/gm20b/gr/sw_nonctx.bin nvidia/gm20b/gr/fecs_sig.bin nvidia/tegra210/xusb.bin nvidia/tegra210/vic04_ucode.bin brcm/brcmfmac4356-pcie.bin brcm/brcmfmac4356-pcie.txt brcm/BCM.hcd"#g' > .config-new
mv -f .config-new .config
make -j$NPROC
popd
