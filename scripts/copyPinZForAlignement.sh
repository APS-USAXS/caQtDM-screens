#!/bin/bash

# this will set values for pin z for alignement
# USAXS horizontal and vertical 
export TempValue=`caget -t 9idcLAX:USAXS_Pin:Pin_z_out`
caput 9idcLAX:USAXS_Pin:Pin_z_in $TempValue
