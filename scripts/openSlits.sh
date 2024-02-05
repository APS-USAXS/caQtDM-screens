#!/bin/bash
 
# this will open slits for radiography
# USAXS horizontal and vertical 
caput usxLAX:m58:c1:m8.VAL 2.5
caput usxLAX:m58:c1:m7.VAL 1.2
# Guard horizonal and vertical
caput usxLAX:GSlit1H:size 2.8
caput usxLAX:GSlit1V:size 1.4
