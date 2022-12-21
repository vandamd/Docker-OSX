#!/bin/bash
sudo cp `sudo find /var/lib/docker -size +10G -name mac_hdd_ng.img | head -1` .
