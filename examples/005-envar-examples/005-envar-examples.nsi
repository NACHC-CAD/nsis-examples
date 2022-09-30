# ---
#
# This script shows some basic functionality of the EnVar plug in.  
# Based on https://nsis.sourceforge.io/Setting_Environment_Variables_Examples
#
# WriteEnvStr.nsh was downloaded from:
# https://github.com/rasa/nsislib/blob/master/WriteEnvStr.nsh
# 
# ---

# defines
!define FOO "Delete me"
!define BAR "Delete me to"

# includes
!include ..\includes\WriteEnvStr.nsh

# definitions
Outfile "005-envar-examples-installer.exe"
InstallDir "C:\temp\nsis-examples\003-choose-dir-example"

Page Directory
Page InstFiles

# section to copy files
Section

	# copy files
	DetailPrint ""
	DetailPrint "Copying files to $InstDir..."
	DetailPrint ""
	SetOutPath "$InstDir\resources"
	File /a /r "resources\"

	#
	# create an environment variable
	#

	DetailPrint ""
	DetailPrint "Creating DELETE_ME environment variable..."
	EnVar::SetHKCU
	EnVar::AddValue "DELETE_ME" "C:\existing_path_1;C:\existing_path_2;C:\existing_path_3;"

	# check to see if the variable was created
	EnVar::Check "DELETE_ME" "NULL"
	Pop $0
	DetailPrint "EnVar::Check returned=|$0| (should be 0)"	

	# add a new string to the existing variable
	DetailPrint ""
	DetailPrint "Appending new path to DELETE_ME..."
	EnVar::AddValue "DELETE_ME" "D:\NEW_PATH;"
	Pop $0
	DetailPrint "EnVar::Check returned=|$0| (should be 0)"	

	# remove a string from the existing variable
	DetailPrint ""
	DetailPrint "Deleting C:\existing_path_3"
	EnVar::DeleteValue "DELETE_ME" "C:\existing_path_3;"
	Pop $0
	DetailPrint "EnVar::Check returned=|$0| (should be 0)"	

	#
	# done
	#
	
	DetailPrint ""
	DetailPrint "Done."


SectionEnd