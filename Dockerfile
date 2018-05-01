FROM alpine

RUN apk add --update alpine-sdk bash

RUN mkdir -p /opt/switch-linux
WORKDIR /opt/switch-linux

ADD *.sh /opt/switch-linux/
