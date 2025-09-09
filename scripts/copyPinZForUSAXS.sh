#!/bin/bash

# this will set values for pin z for alignement
# USAXS horizontal and vertical 
export TempValue=`caget -t usxAERO:m14.VAL`
export offset=25
result=$(echo "$TempValue $offset" | awk '{print $1 + $2}')
caput usxLAX:SAXS_z_out $result
