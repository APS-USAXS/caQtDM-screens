#!/bin/csh


setenv PYTHON /APSshare/anaconda/x86_64/bin/python
setenv DIR    /home/beams/USAXS/Documents/eclipse/USAXS/tools
setenv TOOL   ${DIR}/elog.py

cd $DIR
$PYTHON $TOOL &


########### SVN repository information ###################
# $Date: 2018-09-24 16:52:58 -0500 (Mon, 24 Sep 2018) $
# $Author: kpetersn $
# $Revision: 11443 $
# $URL: https://subversion.xray.aps.anl.gov/bcdaioc/9idcUSX/trunk/9idcUSXApp/op/usaxs/bin/saveToElog.csh $
# $Id: saveToElog.csh 11443 2018-09-24 21:52:58Z kpetersn $
########### SVN repository information ###################
