#!/bin/bash

# this will set values for pin z for alignement
# USAXS horizontal and vertical 
export TempValue=`caget -t 9idcLAX:mxv:c0:m2.VAL`
caput 9idcLAX:SAXS_z_in $TempValue
