#!/bin/bash

# this will set values for slits for SAXS/WAXS
# USAXS horizontal and vertical 
export USAXSH=`caget -t usxLAX:m58:c2:m8.VAL`
export USAXSV=`caget -t usxLAX:m58:c2:m7.VAL`
caput usxLAX:SAXS_hslit_ap $USAXSH
caput usxLAX:SAXS_vslit_ap $USAXSV
# Guard horizonal and vertical
export GUARDH=`caget -t usxLAX:GSlit1H:size`
export GUARDV=`caget -t usxLAX:GSlit1V:size`
caput usxLAX:SAXS_hgslit_ap $GUARDH
caput usxLAX:SAXS_vgslit_ap $GUARDV
