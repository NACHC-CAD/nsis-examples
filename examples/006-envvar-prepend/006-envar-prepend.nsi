# ---
#
# This script shows the basic functionality of the PrependEnvar.nsi script.  
# This script creates an env var and then prepends a value to it.  
# 
# ---

# includes
!include .\PrependEnv.nsh

# definitions
Outfile "006-prepend-example.exe"
InstallDir "C:\temp\nsis-examples\006-prepend-example"

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

    #
    # create an environment variable
    #

	# Create the variable.  
	# If you run this script twice, you well get repetes of the existing_path values, i.e. the behavior seems to be append if exists.  
    DetailPrint ""
    DetailPrint "Creating DELETE_ME environment variable..."
    EnVar::SetHKCU
    EnVar::AddValue "DELETE_ME" "C:\existing_path_1;C:\existing_path_2;C:\existing_path_3;"

    # check to see if the variable was created
    EnVar::Check "DELETE_ME" "NULL"
    Pop $0
    DetailPrint "EnVar::Check returned=|$0| (should be 0)"  

    # prepend a value to the DELETE_ME env_var
	DetailPrint ""
	DetailPrint "Prepending D:\NEW_PATH_TO_PREPEND to the DELETE_ME environment variable"
	Push ${HKEY_CURRENT_USER}
	Push "Environment"
	Push "DELETE_ME"
	Push ";"
	Push "D:\NEW_PATH_TO_PREPEND"
	Call RegPrependString
	Pop $0
	DetailPrint "RegPrependString:Error=$0 (Should be 0)"

SectionEnd

