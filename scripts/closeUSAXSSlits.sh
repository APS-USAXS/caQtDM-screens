#!/bin/bash

# this will open slits for USAXS
# USAXS horizontal and vertical 
export USAXSH=`caget -t 9idcLAX:USAXS_hslit_ap`
export USAXSV=`caget -t 9idcLAX:USAXS_vslit_ap`
caput 9idcLAX:m58:c2:m8.VAL $USAXSH
caput 9idcLAX:m58:c2:m7.VAL $USAXSV
# Guard horizonal and vertical
export GUARDH=`caget -t 9idcLAX:USAXS_hgslit_ap`
export GUARDV=`caget -t 9idcLAX:USAXS_vgslit_ap`
caput 9idcLAX:GSlit1H:size $GUARDH
caput 9idcLAX:GSlit1V:size $GUARDV
