#!/bin/bash

# this will set values for slits for SAXS/WAXS
# USAXS horizontal and vertical 
export USAXSH=`caget -t 9idcLAX:m58:c2:m8.VAL`
export USAXSV=`caget -t 9idcLAX:m58:c2:m7.VAL`
caput 9idcLAX:USAXS_Pin:Pin_hslit_ap $USAXSH
caput 9idcLAX:USAXS_Pin:Pin_vslit_ap $USAXSV
# Guard horizonal and vertical
export GUARDH=`caget -t 9idcLAX:GSlit1H:size`
export GUARDV=`caget -t 9idcLAX:GSlit1V:size`
caput 9idcLAX:USAXS_Pin:Pin_hgslit_ap $GUARDH
caput 9idcLAX:USAXS_Pin:Pin_vgslit_ap $GUARDV
