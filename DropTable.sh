#! /bin/bash


if [ `ls ./DBs/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "${BPurples}===============Drop Tables===============${clear}\n"

read -rp "Which Table do you want to drop?🤔" tbname
while [[ ! -f ./DBs/$dbname/$tbname ]] || [[ -z $tbname ]]
  do
      echo -e "${Red}Invalid Input${clear}"
      read -rp "please enter valid Table name:🙄" tbname
     
done
while [[ -f ./DBs/$dbname/$tbname ]]
do   
     read -rp "Are you sure? [y/N] 😯" response
      case "$response" in
        [yY]) 
            rm ./DBs/$dbname/$tbname 
            rm ./DBs/$dbname/$tbname.Type
            echo -e "${BYellow}Table Deleted successfully${clear}😎"
            echo -e "================================================================="
            source ./Connect-Menu.sh
            ;;
          
        [Nn])
            echo -e "${BCyan}Table Not Deleted${clear}"
            echo -e "================================================================="
            source ./Connect-Menu.sh
          ;;
        *)  
            echo -e "${Red}Invalid Input${clear}"
            echo -e "================================================================="
            source ./DropTable.sh
            ;;
       esac 
done