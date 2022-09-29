# ---
#
# This script creates an installer that writes a dir of files to the install dir.
# The File specified must end with "\" if it is a dir.  
# The File is relative to what is used for "SetOutPath"
#
# /a includes file attributes
# /r is recursive flag
# 
# ---

# definitions
Outfile "002-copy-dir-example-installer.exe"

# section to copy files
Section
	SetOutPath "C:\temp\nsis-examples\002-copy-files"
	File /a /r "resources\"
SectionEnd