#!/bin/bash

# this will open slits for radiography
# USAXS horizontal and vertical 
caput 9idcLAX:m58:c2:m8.VAL 2.5
caput 9idcLAX:m58:c2:m7.VAL 1.2
# Guard horizonal and vertical
caput 9idcLAX:GSlit1H:size 2.8
caput 9idcLAX:GSlit1V:size 1.4
