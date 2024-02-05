#!/usr/bin/env python

"""
runpreUSAXStune.py

called from usaxs_remote_main.ui of 9-ID-C USAXS
"""

import os
import sys
import datetime
import epics
import time

LOGFILE = os.path.join(os.path.dirname(__file__), "log.txt")


def log(msg):
	s = str(datetime.datetime.now())
	s += " " + msg.strip() + "\n"
	f = open(LOGFILE, "a+")
	f.write(s)
	f.close()

log(sys.argv[0])
try:
    epics.caput("usxLAX:AutoCollectionStrInput", "useModeRadiography")
    time.sleep(1)
    epics.caput("usxLAX:AutoCollectionStart", 1)
    
except Exception as _exc:
	log(str(_exc))
