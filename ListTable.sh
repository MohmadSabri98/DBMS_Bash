#! /bin/bash

echo -e "${BPurples}===============Tables===============${clear}\n"
if [ `ls ./DBs/$dbname/ | wc -l` == 0 ]
then     
    echo -e "${Red}No Table Found${clear}😶"
    echo -e "=================================================================" 
    source ./Connect-Menu.sh   
else
    ls ./DBs/$dbname
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi
