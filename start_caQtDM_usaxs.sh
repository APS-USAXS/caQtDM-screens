#!/bin/bash

# configures environment & starts caQtDM for 9-ID USAXS

export EPICS_APP=/APSshare/epics/synApps_5_8/support/xxx-5-8-3
#export EPICS_APP=/APSshare/epics/synApps_5_7/support/xxx-5-7-1

export APS_UI_DIR=/APSshare/adlsys
export EPICS_APP_UI_DIR=${EPICS_APP}/xxxApp/op/ui
export BEAMLINE_UI_DIR=/net/s9dserv/xorApps/epics/screens/usaxs
export DSERV_EPICS_DIR=/net/s9dserv/xorApps/epics
#export STYLESHEET=${BEAMLINE_UI_DIR}/pete.qss
export STYLESHEET=${BEAMLINE_UI_DIR}/stylesheet.qss

#export DEFAULT_EPICS_CA_MAX_ARRAY_BYTES=64008
export DEFAULT_EPICS_CA_MAX_ARRAY_BYTES=8000100

#export CAQTDM=/APSshare/bin/caQtDM
# Use an older version of caQtDM until Kevin confirms the cpu-usage bug is fixed
#export CAQTDM=/APSshare/bin/caQtDM-4.0.0
export CAQTDM=/APSshare/bin/caQtDM-GIT


if [ "" != "$*" ]; then
    screen_s=$*
else
    screen_s=main.ui
fi


#######################################
# support function to simplify repetitive task,
# used to build up display path of supported modules
#
# usage::
#
#    addScreenPath ENVIRONMENT_VARIABLE [SUBDIRECTORY]
#
# QTDMDP is temporary CAQTDM_DISPLAY_PATH
# QTDMDP is internal to this script, no need to export.

function addScreenPath
{
    # $1 is a symbol defined in <synApps>/configure/RELEASE
    # module_path is the path defined for that symbol in the RELEASE file
    module='$'$1
    module_path=`eval echo $module`
    if [ "" != "${module}" ]; then
      if [ "" == "${QTDMDP}" ]; then
        QTDMDP=.
      fi
      if [ "" != "$2" ]; then
        module_path=${module_path}/$2
      fi
      if [ -d ${module_path} ]; then
        # only proceed if directory actually exists
 	QTDMDP=${QTDMDP}:${module_path}
      fi

    fi
}

#######################################
# get environment variables for support modules 

output=`perl -s $EPICS_APP/release.pl -form=bash  $EPICS_APP`
eval $output

# overrides
# none yet

#######################################
# add support for modules defined by environment variables
# modules are *appended* to the growing list of directories

# ============  ================  ===========================
# function      MODULE_VARIABLE   subdirectory with .ui files
# ============  ================  ===========================
addScreenPath      EPICS_APP_UI_DIR
addScreenPath      BEAMLINE_UI_DIR
addScreenPath      BEAMLINE_UI_DIR       usaxs
addScreenPath      BEAMLINE_UI_DIR       saxs
addScreenPath      BEAMLINE_UI_DIR       user
addScreenPath      BEAMLINE_UI_DIR       hardware
addScreenPath      BEAMLINE_UI_DIR       general
addScreenPath      BEAMLINE_UI_DIR       beamline
addScreenPath      BEAMLINE_UI_DIR       user
addScreenPath      BEAMLINE_UI_DIR       ../9ida
addScreenPath      BEAMLINE_UI_DIR       legacy
addScreenPath      DSERV_EPICS_DIR       synApps_5_7/ioc/9idcLAX/9idcLAXApp/op/adl
addScreenPath      DSERV_EPICS_DIR       synApps_5_8/ioc/9idcRIO/9idcRIOApp/op/adl
addScreenPath      ALIVE                 aliveApp/op/ui
addScreenPath      ALIVE                 aliveApp/op/ui/autoconvert
# AREA_DETECTOR needs to be defined because xxx doesn't include it
AREA_DETECTOR=/APSshare/epics/synApps_5_8/support/areaDetector-2-4
addScreenPath      AREA_DETECTOR         ADCore/ADApp/op/ui
addScreenPath      AREA_DETECTOR         ADCore/ADApp/op/ui/autoconvert
addScreenPath      AREA_DETECTOR         ADPilatus/pilatusApp/op/ui
addScreenPath      AREA_DETECTOR         ADPilatus/pilatusApp/op/ui/autoconvert
addScreenPath      ASYN                  opi/caqtdm
addScreenPath      ASYN                  opi/caqtdm/autoconvert
addScreenPath      AUTOSAVE              asApp/op/ui
addScreenPath      AUTOSAVE              asApp/op/ui/autoconvert
addScreenPath      BUSY                  busyApp/op/ui
addScreenPath      BUSY                  busyApp/op/ui/autoconvert
addScreenPath      CALC                  calcApp/op/ui
addScreenPath      CALC                  calcApp/op/ui/autoconvert
addScreenPath      CAMAC                 camacApp/op/ui
addScreenPath      CAMAC                 camacApp/op/ui/autoconvert
addScreenPath      CAPUTRECORDER         caputRecorderApp/op/ui
addScreenPath      CAPUTRECORDER         caputRecorderApp/op/ui/autoconvert
addScreenPath      DAC128V               dac128VApp/op/ui
addScreenPath      DAC128V               dac128VApp/op/ui/autoconvert
addScreenPath      DELAYGEN              delaygenApp/op/ui
addScreenPath      DELAYGEN              delaygenApp/op/ui/autoconvert
addScreenPath      DEVIOCSTATS           op/ui
addScreenPath      DEVIOCSTATS           op/ui/autoconvert
addScreenPath      DXP                   dxpApp/op/ui
addScreenPath      DXP                   dxpApp/op/ui/autoconvert
addScreenPath      IP                    ipApp/op/ui
addScreenPath      IP                    ipApp/op/ui/autoconvert
addScreenPath      IP330                 ip330App/op/ui
addScreenPath      IP330                 ip330App/op/ui/autoconvert
addScreenPath      IPUNIDIG              ipUnidigApp/op/ui
addScreenPath      IPUNIDIG              ipUnidigApp/op/ui/autoconvert
addScreenPath      LOVE                  loveApp/op/ui
addScreenPath      LOVE                  loveApp/op/ui/autoconvert
addScreenPath      MCA                   mcaApp/op/ui
addScreenPath      MCA                   mcaApp/op/ui/autoconvert
addScreenPath      MODBUS                modbusApp/op/ui
addScreenPath      MODBUS                modbusApp/op/ui/autoconvert
addScreenPath      MOTOR                 motorApp/op/ui
addScreenPath      OPTICS                opticsApp/op/ui
addScreenPath      OPTICS                opticsApp/op/ui/autoconvert
addScreenPath      QUADEM                quadEMApp/op/ui
addScreenPath      QUADEM                quadEMApp/op/ui/autoconvert
addScreenPath      SOFTGLUE              softGlueApp/op/ui
addScreenPath      SOFTGLUE              softGlueApp/op/ui/autoconvert
addScreenPath      SSCAN                 sscanApp/op/ui
addScreenPath      SSCAN                 sscanApp/op/ui/autoconvert
addScreenPath      STD                   stdApp/op/ui
addScreenPath      STD                   stdApp/op/ui/autoconvert
addScreenPath      VAC                   vacApp/op/ui
addScreenPath      VAC                   vacApp/op/ui/autoconvert
addScreenPath      VME                   vmeApp/op/ui
addScreenPath      VME                   vmeApp/op/ui/autoconvert
addScreenPath      APS_UI_DIR            sr
#addScreenPath   APS_UI_DIR        sr/absApp
addScreenPath      APS_UI_DIR            sr/bleeps
addScreenPath      APS_UI_DIR            sr/blmApp
addScreenPath      APS_UI_DIR            sr/bmbpm
addScreenPath      APS_UI_DIR            sr/bunchIApp
addScreenPath      APS_UI_DIR            sr/bunchPurity
#addScreenPath   APS_UI_DIR        sr/cpsApp
#addScreenPath   APS_UI_DIR        sr/facilitiesApp
addScreenPath      APS_UI_DIR            sr/fe
addScreenPath      APS_UI_DIR            sr/flagApp
addScreenPath      APS_UI_DIR            sr/Gate_Pictures
addScreenPath      APS_UI_DIR            sr/id
addScreenPath      APS_UI_DIR            sr/idbpm
addScreenPath      APS_UI_DIR            sr/imagingApp
addScreenPath      APS_UI_DIR            sr/iocinfoApp
#addScreenPath   APS_UI_DIR        sr/mpsApp
addScreenPath      APS_UI_DIR            sr/operationsApp
addScreenPath      APS_UI_DIR            sr/p0fbApp
addScreenPath      APS_UI_DIR            sr/pictures
#addScreenPath   APS_UI_DIR        sr/psApp
#addScreenPath   APS_UI_DIR        sr/psApp/noiseMonitoring
addScreenPath      APS_UI_DIR            sr/pss
addScreenPath      APS_UI_DIR            sr/pss/adl
addScreenPath      APS_UI_DIR            sr/scraperApp
addScreenPath      APS_UI_DIR            sr/tuneApp
addScreenPath      APS_UI_DIR            sr/vacApp
addScreenPath      APS_UI_DIR            time
addScreenPath      APS_UI_DIR            time/injtimeApp
addScreenPath      APS_UI_DIR            time/mtimeApp
# ============  ================  ===========================


#######################################
# optional: add support directories not associated with environment variables

# QTDMDP=${QTDMDP}:/APSshare/uisys/sr/id


#######################################
# Define CAQTDM_DISPLAY_PATH
# the .ui file directory list for caQtDM

if [ "" == "${CAQTDM_DISPLAY_PATH}" ]; then
  export CAQTDM_DISPLAY_PATH=${QTDMDP}
else
  # either: pre-pend to display path
  export CAQTDM_DISPLAY_PATH=${QTDMDP}:${CAQTDM_DISPLAY_PATH}

  # or: append to display path
  #export CAQTDM_DISPLAY_PATH=${CAQTDM_DISPLAY_PATH}:${QTDMDP}
fi


#######################################
# optional: support for PVs with large data sizes, such as areaDetector
# This should agree with the environment variable set by the ioc
# see 'putenv "EPICS_CA_MAX_ARRAY_BYTES=64008"' in iocBoot/ioc<target>/st.cmd

if [ "" == "${EPICS_CA_MAX_ARRAY_BYTES}" ]; then
  #export EPICS_CA_MAX_ARRAY_BYTES=64008
  export EPICS_CA_MAX_ARRAY_BYTES=${DEFAULT_EPICS_CA_MAX_ARRAY_BYTES}
fi

#######################################
# optional: execute caQtDM in this support's ui directory

#cd ${EPICS_APP_UI_DIR}


#######################################
# optional: override system default environment variables for Qt and Qwt
# These override system defaults for Qt, Qwt
# Because I'm using a local copy of Qt/Qwt, and not the system
# copy, I need to set some environment variables

#OVERRIDE_QT_BASE=/home/oxygen/MOONEY/Download/Qt
#export QTDIR=${OVERRIDE_QT_BASE}/qt-4.8.4
#export QT_PLUGIN_PATH=
#export QT_PLUGIN_PATH=${QT_PLUGIN_PATH}:${OVERRIDE_QT_BASE}/qt-4.8.4/plugins
#export QT_PLUGIN_PATH=${QT_PLUGIN_PATH}:${OVERRIDE_QT_BASE}/qwt-6.0/designer/plugins/designer


#######################################
# optional: other environment variables that may need local definitions
# these are copied from caQtDM's source for startDM_Local

#export QTCONTROLS_LIBS=`pwd`/caQtDM_Binaries
#export QTBASE=${QTCONTROLS_LIBS}
#export QT_PLUGIN_PATH=${QTBASE}
#export CAQTDM_DISPLAY_PATH=`pwd`/caQtDM_Tests

export MEDM_EXEC_LIST=
# For drag-and-drop workaround at APS, need /APSshare/bin/xclip
export PATH=${PATH}:/APSshare/bin
export CAQTDM_EXEC_LIST='Probe;probe &P &:UI File;echo &A:PV Name(s);echo &P:Copy PV name; echo -n &P| xclip -i -sel clip:Paste PV name;caput &P `xclip -o -sel clip`'

export START_PUTRECORDER=${EPICS_APP}/start_putrecorder
export MACROS_PY=${EPICS_APP_UI_DIR}/../python/macros.py
export EDITOR=nedit
export QT_PLUGIN_PATH=/APSshare/caqtdm/plugins
export LD_LIBRARY_PATH=/APSshare/caqtdm/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/APSshare/epics/base-3.14.12.5/lib/linux-x86_64


#######################################
# optional: access to ioctim and bcdapc15

#export EPICS_CA_ADDR_LIST="164.54.53.99 164.54.54.88"
if [ "" = "${EPICS_CA_ADDR_LIST}" ]; then
    export EPICS_CA_ADDR_LIST=`/APSshare/bin/sector_epics_net 9id`
fi

#######################################
# start caQtDM
#$CAQTDM -noMsg ${screen_s} 
$CAQTDM -style plastique -stylefile ${STYLESHEET} -noMsg ${screen_s} 
