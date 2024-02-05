#!/bin/bash

# this will set values for slits for USAXS
# USAXS horizontal and vertical 
export USAXSH=`caget -t usxLAX:m58:c2:m8.VAL`
export USAXSV=`caget -t usxLAX:m58:c2:m7.VAL`
caput usxLAX:USAXS_hslit_ap $USAXSH
caput usxLAX:USAXS_vslit_ap $USAXSV
# Guard horizonal and vertical
export GUARDH=`caget -t usxLAX:GSlit1H:size`
export GUARDV=`caget -t usxLAX:GSlit1V:size`
caput usxLAX:USAXS_hgslit_ap $GUARDH
caput usxLAX:USAXS_vgslit_ap $GUARDV
