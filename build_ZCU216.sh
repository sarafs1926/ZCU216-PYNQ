#!/bin/bash

 

set -e

set -x

 

echo `date` > runtime.txt

 

# (2020.2) tools

#source 2020.2.sh

 

export buildroot=`pwd`

# NOTE link to your appropriate files here:
prebuilt=/home/sara/Downloads/focal.aarch64.2.7.0_2021_11_17.tar.gz
bsp=/home/sara/Downloads/xilinx-zcu216-v2020.2-final.bsp
 

if [ ! -e "$prebuilt" ]; then

    echo "$prebuilt DNE"

    exit

fi

 

if [ ! -d "ZCU216-PYNQ" ]; then

    git clone --recursive https://github.com/sarafs1926/ZCU216-PYNQ

fi

 

pushd ZCU216-PYNQ/ZCU216

ln -s $bsp

popd

 

# git build.sh so that other boards are not rebuilt

pushd ZCU216-PYNQ/PYNQ

echo "" > build.sh

git commit -a -m "clean out build.sh"

popd

 
# move tics files to proper directory
cp -a ZCU216-PYNQ/tics/. ZCU216-PYNQ/PYNQ/sdbuild/packages/xrfclk/package/xrfclk/

pushd ZCU216-PYNQ/PYNQ/sdbuild

make BOARDDIR=$buildroot/ZCU216-PYNQ PREBUILT=$prebuilt

 

BOARD=ZCU216

VERSION=2.7.0

boardname=$(echo ${BOARD} | tr '[:upper:]' '[:lower:]' | tr - _)

timestamp=$(date +'%Y_%m_%d')

imagefile=${boardname}_${timestamp}.img

zipfile=${boardname}_${timestamp}.zip

mv output/${BOARD}-${VERSION}.img $imagefile

zip -j $zipfile $imagefile

 

popd

 

 

 

echo `date` >> runtime.txt

 

cat runtime.txt

 
