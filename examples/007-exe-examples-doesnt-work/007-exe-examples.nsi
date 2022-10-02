# ---
#
# DOES NOT WORK
#
# This script tries to create a dir and a logical link.  
# It does not work.  
# 
# ---

RequestExecutionLevel admin

# includes
!include .\PrependEnv.nsh

# definitions
Outfile "007-exec-examples.exe"
InstallDir "C:\temp\nsis-examples\007-exe-examples"

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
    DetailPrint "Making dir $InstDir"
	Exec 'mkdir $InstDir\delete_me'
	Pop $0
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"

	# create a logical link
	DetailPrint ""
	DetailPrint "Creating logical link as C:\_YES to $InstDir\delete_me."
	Exec 'mklink /D $InstDir\_MY_LINK $InstDir\delete_me'
	Pop $0
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"

SectionEnd

