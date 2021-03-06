# ZCU216-PYNQ

Board repo for ZCU216 RFSOC. Contains

* ZCU216 board folder with updated device tree. 
* tics folder with files that program the LMK/LMX PLLs for the ZCU216 RFDCs. 

The user has to also download the prebuilt PYNQ 2.7 rootfs file `https://www.xilinx.com/bin/public/openDownload?filename=focal.aarch64.2.7.0_2021_11_17.tar.gz` as well as the ZCU216 Petalinux 2020.2 BSP from the Xilinx website. 

How to make image. 

Method #1: Run the `build_ZCU216.sh` script after changing the path names for the BSP and rootfs files as indicated within the script. This method automatically places the correct tics files into the correct folder as indicated above. It should take about 4 hours to build the board.

Method #2: 

First,

* Place the ZCU216 board folder inside your PYNQ repo in the `boards` folder. Put the ZCU216 Petalinux 2020.2 BSP within that folder. 
* Place the two tics text files inside your PYNQ repo in the `sdbuild/packages/xrfclk/package/xrfclk` folder, along with the other files that were already there.

Then, from the PYNQ repo in the `sdbuild` folder, run:

`make images PREBUILT=<Path/to/prebuilt/tarball/PYNQ2.7> BOARDS=ZCU216`

Note that this method will attempt to make all the boards in the `PYNQ/boards` folder. If you do not want this to happen, do a local commit of your PYNQ fork after removing the ZCU104 and PYNQ-Z1 board. The PYNQ-Z2 board has to stay as documented here: https://discuss.pynq.io/t/pynq-2-5-2-how-to-disable-synthesis-for-undesired-boards-to-save-time-and-licences/1317 . It should take about 10 hours to build the board.

