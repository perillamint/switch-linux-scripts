#!/bin/bash
GPGOPTS="--no-default-keyring --homedir $(pwd)/gpg --keyring pubkeys.asc"

set -e

mkdir -p $(pwd)/gpg

gpg $GPGOPTS --recv-key 0853E2F2CAD469167741FCA120574C97059E1825

wget -O prebuilt.tar.xz https://maedhros.quendi.moe/switch-linux/prebuilt.tar.xz
wget -O prebuilt.tar.xz.asc https://maedhros.quendi.moe/switch-linux/prebuilt.tar.xz.asc

gpg $GPGOPTS --verify prebuilt.tar.xz.asc

sudo tar xvf prebuilt.tar.xz
