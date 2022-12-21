#!/bin/bash
docker run -it \
    --name macos_base \
    --device /dev/kvm \
    -p 50922:10022 \
    -p 5999:5999 \
    -e NOPICKER=true \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e EXTRA="-display none -vnc 0.0.0.0:99" \
    -e WIDTH=1366 \
    -e HEIGHT=768 \
    sickcodes/docker-osx:latest
