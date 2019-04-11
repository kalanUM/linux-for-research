#!/bin/bash

# takes 2 arguments -- file & integer
# generates frequency table from CSV data -- comma delimiter 
# handles quoted delimiters 

echo

if [ "$#" -eq 0 ]; then
  echo "No arguments provided.  Exiting..."
  exit 0;
elif [ -e "$1" ]; then
  echo "Argument 1 is a file:  $1"
else
  echo "Argument 1 is not a file.  Exiting.."
  exit 0;
fi

if [ "$2" -eq "$2" ] 2> /dev/null; then
  echo "Argument 2 is a valid integer:  $2"
else
  echo "Argument 2 is not an integer.  Exiting..."
  exit 0;
fi

echo
echo "Generating Frequency Table for Column $2"
echo

awk -v COLUMN="$2" 'BEGIN { FPAT="([^,]*)|(\"[^\"]*\")" } NR>1 { print $COLUMN }' $1 | sort | uniq -c | sort -nr
