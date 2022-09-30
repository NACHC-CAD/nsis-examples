# ---
#
# This script edits the path system environment variable.
# Based on:
# https://nsis.sourceforge.io/EnVar_plug-in 
# 
# ---

# defines
!define FOO "Delete me"
!define BAR "Delete me to"

# includes
!include ..\includes\WriteEnvStr.nsh

# definitions
Outfile "004-create-env-var-example-installer.exe"
InstallDir "C:\temp\nsis-examples\003-choose-dir-example"

Page Directory
Page InstFiles

# section to copy files
Section

	# copy files
	SetOutPath "$InstDir\resources"
	File /a /r "resources\"

	#
	# set env variables
	#
	
	# foo
	Push FOO
	Push '${FOO}'
	Call WriteEnvStr
	
	# bar
	Push BAR
	Push '${BAR}'
	Call WriteEnvStr
	
	
SectionEnd