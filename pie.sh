#!/bin/bash 

# Pie ASCII printer
#
#             (
#              )
#         __,.---.,__
#     ,-=`  /  |  \  `=-.
#    :--.,___________,.--;
#     \.,_____________,./ 

# set steam variables

STEAM1="             ("
STEAM2="              )"

# set crust variables  

CRUST1="         __,.---.,__"
CRUST2="     ,-='  /  |  \  '=-."

# set base variables 

BASE1="    :--.,___________,.--;"
BASE2="     \.,_____________,./ "

# echo pie vars (in quotes to preserve whitespaces) 
# echo includes newline termination (printf does not) 

echo
echo "$STEAM1"
echo "$STEAM2"
echo "$CRUST1"
echo "$CRUST2"
echo "$BASE1"
echo "$BASE2"
echo
