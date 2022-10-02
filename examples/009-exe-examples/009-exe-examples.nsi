# ---
#
# This script tries to create a dir and a logical link.  
# 
# ---

RequestExecutionLevel admin

# includes
!include .\PrependEnv.nsh

# definitions
Outfile "009-exec-examples.exe"
InstallDir "C:\temp\nsis-examples\009-exe-examples"
ShowInstDetails show

Page Directory
Page InstFiles

# section to copy files and manipulate env variable
Section

    # copy files
    DetailPrint ""
    DetailPrint "Copying files to $InstDir..."
    DetailPrint ""
    SetOutPath "$InstDir\resources"
    File /a /r "resources\"

	# create a dir
    DetailPrint ""
    DetailPrint "Making dir $InstDir\delete_me"
	CreateDirectory $InstDir\delete_me
	Pop $0
	Pop $1
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"
	DetailPrint "$1"

	# create a short cut
	DetailPrint ""
	DetailPrint "Creating SHORTCUT as $InstDir\_MY_SHORTCUT to $InstDir\delete_me."
	CreateShortCut $InstDir\_MY_SHORTCUT.lnk $InstDir\delete_me
	Pop $0
	Pop $1
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"
	DetailPrint "$1"

	# create a logical link
	DetailPrint ""
	DetailPrint "Creating LINK as $InstDir\_MY_SHORTCUT to $InstDir\delete_me."
	nsExec::ExecToStack 'cmd.exe /C mklink /D $InstDir\_MY_LINK $InstDir\delete_me'
	Pop $0
	Pop $1
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"
	DetailPrint "$1"

SectionEnd

