#!/bin/bash

# this will reset order numbers together... 

caput 9idcLAX:USAXS:FS_OrderNumber 1
caput usaxs_pilatus1:cam1:FileNumber 1
caput usaxs_pilatus1:Nexus1:FileNumber 1
caput usaxs_pilatus2:Nexus1:FileNumber 1
caput usaxs_pilatus2:cam1:FileNumber 1
