# ---
#
# This script tries to create a dir and a logical link.  
# 
# ---

RequestExecutionLevel admin

# includes
!include .\PrependEnv.nsh

# definitions
Outfile "008-exec-examples.exe"
InstallDir "C:\temp\nsis-examples\008-exe-examples"
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
	nsExec::ExecToStack 'mkdir $InstDir\delete_me'
	Pop $0
	Pop $1
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"
	DetailPrint "$1"

	# create a logical link
	DetailPrint ""
	DetailPrint "Creating logical link as $InstDir\_MY_LINK to $InstDir\delete_me."
	nsExec::ExecToStack 'mklink /D $InstDir\_MY_LINK $InstDir\delete_me'
	Pop $0
	Pop $1
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"
	DetailPrint "$1"

SectionEnd

