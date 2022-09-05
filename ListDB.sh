#! /bin/bash

echo -e "${BPurples}===============Database names===============${clear}\n"
if [ $(ls ./DBs | wc -l) == 0 ]
then     
    echo -e "${Red}No Table Found${clear}😶"
    echo -e "=================================================================" 
    source ./run   
else
    ls ./DBs
    echo -e "================================================================="
    source ./run
fi