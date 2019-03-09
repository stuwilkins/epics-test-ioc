TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = test
# test.dbd will be created and installed
DBD += test.dbd

# test.dbd will be made up from these files:
test_DBD += base.dbd

# Include dbd files from all support applications:
test_DBD += asyn.dbd
test_DBD += motorSupport.dbd
test_DBD += devSoftMotor.dbd
test_DBD += motorSimSupport.dbd
test_DBD += asSupport.dbd
test_DBD += calcSupport.dbd
test_DBD += sscanSupport.dbd
test_DBD += simDetectorSupport.dbd

# Add all the support libraries needed by this IOC
test_LIBS += softMotor
test_LIBS += motorSimSupport
test_LIBS += motor
test_LIBS += asyn
test_LIBS += autosave
test_LIBS += calc
test_LIBS += sscan
test_LIBS += simDetector

# test_registerRecordDeviceDriver.cpp derives from test.dbd
test_SRCS += test_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
test_SRCS_DEFAULT += testMain.cpp
test_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#test_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
test_LIBS += $(EPICS_BASE_IOC_LIBS)

DBD_NAME = test
include $(ADCORE)/ADApp/commonDriverMakefile

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

