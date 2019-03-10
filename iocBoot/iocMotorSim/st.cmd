#!../../bin/linux-x86_64/test

< envPaths
cd($(TOP))

## Register all support components
dbLoadDatabase("$(TOP)/dbd/test.dbd",0,0)
test_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadTemplate("db/sensor.substitutions")
dbLoadTemplate("db/motorSim.substitutions")
dbLoadRecords("db/fakemotor.db", "Sys=XF:31IDA-OP,Dev={Tbl-Ax:FakeMtr},Mtr=XF:31IDA-OP{Tbl-Ax:X1}Mtr")

# Create simulated motors: ( start card , start axis , low limit, high limit, home posn, # cards, # axes to setup)
motorSimCreate( 0, 0, -32000, 32000, 0, 1, 6 )
# Setup the Asyn layer (portname, low-level driver drvet name, card, number of axes on card)
drvAsynMotorConfigure("motorSim1", "motorSim", 0, 6)

## autosave/restore machinery
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("info_positions.sav")
set_pass0_restoreFile("info_settings.sav")
set_pass1_restoreFile("info_settings.sav")

cd ${TOP}/iocBoot/${IOC}
iocInit()

## more autosave/restore machinery
cd ${TOP}/as/req
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")

dbl
