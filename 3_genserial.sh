#!/bin/bash
mkdir tmp && cd tmp
curl https://raw.githubusercontent.com/sickcodes/Docker-OSX/master/custom/generate-unique-machine-values.sh -O
wget https://raw.githubusercontent.com/sickcodes/Docker-OSX/master/custom/generate-unique-machine-values.sh
chmod +x generate-unique-machine-values.sh
./generate-unique-machine-values.sh --count 1 --output-env ../my_permanent_serial_number.sh
cd ..
rm -rf tmp
