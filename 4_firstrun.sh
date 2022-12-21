#!/bin/bash
source ./my_permanent_serial_number.sh
sudo docker run -i \
    --name macos \
    --privileged \
    --device /dev/kvm \
    -v "${PWD}/mac_hdd_ng.img:/image" \
    -p 5999:5999 \
    -p 1234:1234 \
    -p 50922:10022 \
    -e TERMS_OF_USE=i_agree \
    -e NOPICKER=true \
    -e GENERATE_SPECIFIC=true \
    -e DEVICE_MODEL="${DEVICE_MODEL}" \
    -e SERIAL="${SERIAL}" \
    -e BOARD_SERIAL="${BOARD_SERIAL}" \
    -e UUID="${UUID}" \
    -e MAC_ADDRESS="${MAC_ADDRESS}" \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e EXTRA="-display none -vnc 0.0.0.0:99" \
    -e WIDTH="${WIDTH}" \
    -e HEIGHT="${HEIGHT}" \
    sickcodes/docker-osx:naked
