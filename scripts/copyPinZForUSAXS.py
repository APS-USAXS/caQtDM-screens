#!/usr/bin/env python

"""
copyPinZForUSAXS.py

called from main.ui of 9-ID-C USAXS
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
	temp = epics.caget("usxAERO:m14.VAL")+25
	epics.caput("usxLAX:SAXS_z_out", temp)
except Exception as _exc:
	log(str(_exc))
