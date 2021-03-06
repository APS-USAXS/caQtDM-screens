#!/bin/bash

# this will set values for slits for USAXS
# USAXS horizontal and vertical 
export USAXSH=`caget -t 9idcLAX:m58:c2:m8.VAL`
export USAXSV=`caget -t 9idcLAX:m58:c2:m7.VAL`
caput 9idcLAX:USAXS_hslit_ap $USAXSH
caput 9idcLAX:USAXS_vslit_ap $USAXSV
# Guard horizonal and vertical
export GUARDH=`caget -t 9idcLAX:GSlit1H:size`
export GUARDV=`caget -t 9idcLAX:GSlit1V:size`
caput 9idcLAX:USAXS_hgslit_ap $GUARDH
caput 9idcLAX:USAXS_vgslit_ap $GUARDV
