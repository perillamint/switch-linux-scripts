FROM ubuntu:bionic

RUN apt-get update \
 && apt-get install alpine-sdk bash xz -y

RUN mkdir -p /opt/switch-linux

WORKDIR /opt/switch-linux

ADD *.sh /opt/switch-linux/
