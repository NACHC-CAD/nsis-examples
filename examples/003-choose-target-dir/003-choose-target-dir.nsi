# ---
#
# This script allows the user to select the target dir where the app will be installed.  
# This script is based on 002-copy-dir
# 
# ---

# definitions
Outfile "003-choose-target-dir-example-installer.exe"
InstallDir "C:\temp\nsis-examples\003-choose-dir-example"

Page Directory
Page InstFiles

# section to copy files
Section
	SetOutPath "$InstDir\resources"
	File /a /r "resources\"
SectionEnd