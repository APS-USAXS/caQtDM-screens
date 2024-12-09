#!/usr/bin/env python

"""
resetOrderNumbers.py

called from main.ui of 12-ID-C USAXS
"""

import os
import sys
import datetime
import epics

LOGFILE = os.path.join(os.path.dirname(__file__), "log.txt")


def log(msg):
	s = str(datetime.datetime.now())
	s += " " + msg.strip() + "\n"
	f = open(LOGFILE, "a+")
	f.write(s)
	f.close()

log(sys.argv[0])
try:
	epics.caput("usxLAX:USAXS:FS_OrderNumber", 1)
	epics.caput("usaxs_pilatus1:cam1:FileNumber", 1)
	epics.caput("usaxs_pilatus1:HDF1:FileNumber", 1)
	epics.caput("usaxs_pilatus2:HDF1:FileNumber", 1)
	epics.caput("usaxs_pilatus2:cam1:FileNumber", 1)
	epics.caput("usaxs_pilatus3:HDF1:FileNumber", 1)
	epics.caput("usaxs_pilatus3:cam1:FileNumber", 1)
	epics.caput("12idcDEX:HDF1:FileNumber", 1)
	epics.caput("12idcDEX:TIFF1:FileNumber", 1)
    
    
except Exception as _exc:
	log(str(_exc))
