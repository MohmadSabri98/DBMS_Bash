#! /bin/bash

if [ $(ls ./DBs/ | wc -l) == 0 ]
then
      echo -e "${Red}No Database Found${clear}"
      echo -e "================================================================="
      source ./run
fi      
echo -e "${BBlue}===============Connect Database===============${clear}\n"
read -rp "Please Enter Database You Want To Connect: " dbname
if [[ ! -d ./DBs/$dbname ]] || [[ -z $dbname ]]
then  
      echo -e "${Red}$dbname Database Not Exists Create new one${clear}"
      echo -e "================================================================="
      source ./run
else
      echo -e "                ${BYellow}Database Exists${clear}                "
      echo -e "================================================================="

      source ./Connect-Menu.sh
fi