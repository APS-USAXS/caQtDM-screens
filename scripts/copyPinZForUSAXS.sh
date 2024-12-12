#!/bin/bash

# this will set values for pin z for alignement
# USAXS horizontal and vertical 
export TempValue=`caget -t usxAERO:m14.VAL`
((TempValue += 25))
caput usxLAX:SAXS:SAXS_z_out $TempValue
