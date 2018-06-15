#!/bin/bash

echo "Please put your Nintendo Switch in Tegra RCM mode."
pushd shofel2/exploit
./shofel2.py ../../docker-result/cbfs.bin ../../docker-result/coreboot.rom
popd
