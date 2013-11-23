#!/bin/bash
#
# # Script to check for unique values in a file
# # Rev. 1.0 last modified 04/18/06
# # written by Malious da mad poodle hustlah
#
# Build list of values to check
FILE=$1
LIST="`cat $FILE | awk '{split($0,a,":"); print a[3]}'`"

# Populate the array
declare -a values
values=(`echo $LIST`)

# Determine the number of entries in the array
entry_count=${#values[*]}

# Create a loop to iterate through the array
for ((i=0; i<$entry_count; i++))
   do
      y=0
# Create a loop to compare each value in the array against all values
      for ((x=0; x<$entry_count; x++))
         do
# Check for matches in the array and increment value of y by one for each match
            if [ ${values[${i}]} -eq ${values[${x}]} ]
               then y=$(expr $y + 1)
            fi
         done
# Ensure that we do not have more than one match.  If so, report error.
      if [ $y -gt 1 ]
         then echo "Error: uid ${values[${i}]} has ${y} matching entries"
      fi
   done
