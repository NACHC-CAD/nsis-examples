# ---
#
# This script shows some basic functionality of the EnVar plug in.  
# Based on https://nsis.sourceforge.io/Setting_Environment_Variables_Examples
#
# WriteEnvStr.nsh was downloaded from:
# https://github.com/rasa/nsislib/blob/master/WriteEnvStr.nsh
# 
# ---

# definitions
Outfile "005-envar-examples-installer.exe"
InstallDir "C:\temp\nsis-examples\005-envar-examples-installer"

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