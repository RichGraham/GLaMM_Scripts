#!/bin/sh
#Copy the shell scripts to a folder in the path
ln -sf ~/source/GLaMM_Scripts/dampingFn/dampFn_glm.sh  ~/bin
ln -sf ~/source/GLaMM_Scripts/dampingFn/sub_glm.sh  ~/bin

#Check correct numnber of command line arguments
if (( $# > 1 )); then
   echo "usage: makeAll.sh [c compiler choice: defaults to gcc if not specified]"
  exit 1
fi

if (( $# < 1 )); then
    compiler=gcc
    echo "Defaulting to gcc compiler"
fi



#Check correct numnber of command line arguments
if [[ $# -eq 1 ]]; then
    compiler=$1
   echo "Using compiler $compiler."
fi


#Only needed if c compiler to be used
#for f in <LIST OF DIRECTORIES>; do
#    echo $f
#    cd $f
#    make CC=$compiler
#    cd ..
#    echo ""
#done


