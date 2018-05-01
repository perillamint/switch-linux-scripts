#!/bin/bash

set -e
NPROC=$(nproc --all)

pushd imx_usb_loader
make -j$NPROC
popd
