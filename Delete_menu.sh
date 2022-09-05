#! /bin/bash

if [ `ls ./DBs/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "${BPurple}===============Delete From Table===============${clear}\n"

read -rp "Enter Table You Want To Delete from : " tablename
export tablename
while [[ -z $tablename ]] || [[ $tablebname == *['!''@#/$\"*{^})(+_/=-]>[<?']* ]]
do 
  echo -e "${Red}Invalid Input${clear}🤡"
  read -rp "PLease Enter Table Name Again:🧐" tablename
done

if [ -f ./DBs/$dbname/$tablename ]
then

    select choice in "Delete All Records😲" "Delete Record😧" "Back To Menu"
    do
        case $REPLY in
        1) source ./DeleteAllRecord.sh ;;
        2) source ./DeleteRecord.sh ;;
        3) source ./Connect-Menu.sh ;;
        *) echo -e "${Red}invalid option${clear}";exit;; 

        esac

    done
else
    echo -e "${Red}Table Not Exists${clear}"
    echo -e "================================================================="
    source ./Delete_menu.sh
fi