FROM ubuntu:bionic

RUN apt-get update \
 && apt-get install -y build-essential xz-utils wget git \
    python python3 python-dev swig \
    pkg-config m4 bison flex curl zlib1g-dev libusb-1.0-0-dev libssl-dev \
    bc linux-firmware

RUN mkdir -p /opt/switch-linux

WORKDIR /opt/switch-linux

ADD *.sh /opt/switch-linux/
ADD dockerscript/*.sh /opt/switch-linux/
ADD brcmfmac4356-pcie.txt /lib/firmware/brcm/brcmfmac4356-pcie.txt
ADD patches /opt/switch-linux/patches/

## !! WARNING: UNLICENSED PROPRIETARY BLOBS AHEAD !!

ADD vendor/brcmfmac4356a3-pcie.bin /lib/firmware/brcm/brcmfmac4356-pcie.bin
ADD vendor/brcmfmac4356a3-pcie.txt /lib/firmware/brcm/brcmfmac4356-pcie.txt
ADD vendor/BCM.hcd /lib/firmware/brcm/BCM.hcd

ENTRYPOINT ["/opt/switch-linux/buildshell.sh"]
