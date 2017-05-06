#!/bin/bash
#Reads input and output files and constructs a damping function

#Check correct number of command line arguments
if (( $# < 2 )); then
    echo "Constructs a damping function from GLaMM model output files" >&2
    echo " ">&2
   echo "Usage  : dampFn_glm.sh [*.list file of input files] [line number in output file to use]" >&2
   echo "Example:  dampFn_glm.sh 1000 Cv0-0.list" >&2
  exit 1
fi

#====Extract arguments====
ListFile=$1
LineNumber=$2

subfilename=${ListFile%%.*}
outputFile=$(echo "$subfilename".dat)
if [ -f $outputFile ] ; then
    rm $outputFile
fi


arr1=( $( cut -d' ' -f1 $ListFile ) )
arr2=( $( cut -d' ' -f2 $ListFile ) )

for i in $(seq 0 $(expr ${#arr1[@]} - 1))
do
    FileName=${arr1[$i]}
    Strain=${arr2[$i]}
    echo Input file: $FileName $Strain
    Line=$(sed -n "$LineNumber","$LineNumber"p $FileName)
    #echo $Line
    Damping=$(awk  '{print $2}' <<< "$Line")
    Damping=`echo ${Damping} | sed -e 's/[eE]+*/\\*10\\^/'`
    Damping=$(echo $Damping | bc -l )
    Time=$(awk  '{print $1}' <<< "$Line")
    echo $FileName
    echo $Time

        if (( $i == 0 )); then
   	    BaseLine=$Damping
	fi
	ans=$(echo $Damping / $BaseLine | bc -l )
	echo $Strain $ans >> $outputFile
	echo ""
done

