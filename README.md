# ZCU216-PYNQ

Board repo for ZCU216 RFSOC. Contains

* ZCU216 board folder with updated device tree. Place this board folder inside your PYNQ repo in the `boards` folder.
* tics folder with files that program the LMK/LMX PLLs for the ZCU216 RFDCs. Before you build the ZCU216 image file, place these files inside your PYNQ repo in the `sdbuild/packages/xrfclk/package/xrfclk` folder, along with the other files that were already there.

How to make image. From the PYNQ repo in the `sdbuild` folder, run:

`make images PREBUILT=<Path/to/prebuilt/tarball/PYNQ2.7> BOARDS=ZCU216`

Note that this method will attempt to make all the boards in the `PYNQ/boards` folder. If you do not want this to happen, do a local commit of your PYNQ fork after removing the ZCU104 and PYNQ-Z1 board. The PYNQ-Z2 board has to stay as documented here: https://discuss.pynq.io/t/pynq-2-5-2-how-to-disable-synthesis-for-undesired-boards-to-save-time-and-licences/1317

