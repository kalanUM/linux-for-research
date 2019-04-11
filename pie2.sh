#!/bin/bash 

# Modular Pie ASCII printer 
# 
# includes other shell script files 
# using relative paths 
# expects files to be in "pie_modules" directory 

# Bash only syntax  
source pie_modules/steam.sh

# sh/POSIX compliant syntax  
. pie_modules/crust.sh
. pie_modules/base.sh
echo

