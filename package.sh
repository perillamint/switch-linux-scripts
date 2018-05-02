#!/bin/bash

tar cJvf prebuilt.tar.xz docker-result
gpg --default-key 0853E2F2CAD469167741FCA120574C97059E1825 --detach-sig --armor --output prebuilt.tar.xz.asc prebuilt.tar.xz
