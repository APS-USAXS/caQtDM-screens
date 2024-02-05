#!/bin/bash

# this will open slits for SAXS/WAXS
# USAXS horizontal and vertical 
export USAXSH=`caget -t usxLAX:SAXS_hslit_ap`
export USAXSV=`caget -t usxLAX:SAXS_vslit_ap`
caput usxLAX:m58:c1:m8.VAL $USAXSH
caput usxLAX:m58:c1:m7.VAL $USAXSV
# Guard horizonal and vertical
export GUARDH=`caget -t usxLAX:SAXS_hgslit_ap`
export GUARDV=`caget -t usxLAX:SAXS_vgslit_ap`
caput usxLAX:GSlit1H:size $GUARDH
caput usxLAX:GSlit1V:size $GUARDV
