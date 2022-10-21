#!/bin/bash

# this will set values for pin z for alignement
# USAXS horizontal and vertical 
export TempValue=`caget -t 9idcAERO:m14.VAL`
caput 9idcLAX:SAXS_z_in $TempValue
