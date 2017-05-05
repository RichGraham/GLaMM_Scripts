#!/bin/bash
#Reads input and output files and constructs a damping function

#Check correct number of command line arguments
if (( $# < 2 )); then
    echo "Constructs a damping function from GLaMM model output files" >&2
    echo " ">&2
   echo "Usage  : dampFn_glm.sh [line number in output file to use][*.list file of input files]" >&2
   echo "Example:  dampFn_glm.sh 1000 Cv0-0.list" >&2
  exit 1
fi

#====Extract arguments====
LineNumber=$1
ListFile=$2

arr1=( $( cut -d' ' -f1 $ListFile ) )

for i in $(seq 1 $(expr ${#arr1[@]} - 1))
do
    FileName=${arr1[$i]}
    echo Input file: $FileName
    sed -n 3,3p 2nd40$FileName.dat 

done

