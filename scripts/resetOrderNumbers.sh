#!/bin/bash

# this will reset order numbers together... 

caput usxLAX:USAXS:FS_OrderNumber 1
caput usaxs_pilatus1:cam1:FileNumber 1
caput usaxs_pilatus1:Nexus1:FileNumber 1
caput usaxs_pilatus2:Nexus1:FileNumber 1
caput usaxs_pilatus2:cam1:FileNumber 1
caput usaxs_pilatus3:Nexus1:FileNumber 1
caput usaxs_pilatus3:cam1:FileNumber 1
