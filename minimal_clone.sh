#!/bin/bash
git clone https://github.com/fail0verflow/shofel2.git
git clone https://github.com/boundarydevices/imx_usb_loader.git

cd imx_usb_loader
git reset --hard 0a322b01cacf03e3be727e3e4c3d46d69f2e343e
cd ..
