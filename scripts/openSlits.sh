#!/bin/bash
 
# this will open slits for radiography
# USAXS horizontal and vertical 
caput usxLAX:m58:c1:m8.VAL 1.5
caput usxLAX:m58:c1:m7.VAL 1.5
# Guard horizonal and vertical
caput usxLAX:GSlit1H:size 1.6
caput usxLAX:GSlit1V:size 1.6
