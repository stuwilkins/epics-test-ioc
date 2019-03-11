TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = softIoc
# test.dbd will be created and installed
DBD += softIoc.dbd

# test.dbd will be made up from these files:
softIoc_DBD += base.dbd

# Include dbd files from all support applications:
softIoc_DBD += asyn.dbd
softIoc_DBD += motorSupport.dbd
softIoc_DBD += devSoftMotor.dbd
softIoc_DBD += motorSimSupport.dbd
softIoc_DBD += asSupport.dbd
softIoc_DBD += calcSupport.dbd
softIoc_DBD += sscanSupport.dbd
softIoc_DBD += simDetectorSupport.dbd

# Add all the support libraries needed by this IOC
softIoc_LIBS += softMotor
softIoc_LIBS += motorSimSupport
softIoc_LIBS += motor
softIoc_LIBS += asyn
softIoc_LIBS += autosave
softIoc_LIBS += calc
softIoc_LIBS += sscan
softIoc_LIBS += simDetector

# softIoc_registerRecordDeviceDriver.cpp derives from test.dbd
softIoc_SRCS += softIoc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
softIoc_SRCS_DEFAULT += softIocMain.cpp
softIoc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#softIoc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
softIoc_LIBS += $(EPICS_BASE_IOC_LIBS)

DBD_NAME = softIoc
include $(ADCORE)/ADApp/commonDriverMakefile

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

