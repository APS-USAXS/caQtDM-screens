#!/bin/bash

# this will set values for pin z for alignement
# USAXS horizontal and vertical 
export TempValue=`caget -t usxLAX:USAXS_Pin:Pin_z_out`
caput usxLAX:SAXS_z_in $TempValue
