#! /bin/bash


if [ $(ls ./DBs/ | wc -l) == 0 ]
then
      echo -e "${Red}No Database Found${clear}"
      echo -e "================================================================="
      source ./run
fi      

echo -e "${BBlue}===============Drop Database===============${clear}\n"
read -rp "Which Database do you want to drop?🤔" name

while [[ ! -d ./DBs/$name ]] || [[ -z $name ]]
  do
      echo -e "${Red}Invalid Input${clear}"
      read -rp "please enter valid Database Again:🙄" name
     
done
while [[ -d ./DBs/$name ]]
do   
     read -rp "Are you sure? [y/N] 😯  " response
      case "$response" in
       [yY]) 
      rm -r ./DBs/$name  
      echo -e "${BYellow}Database Deleted Successfully${clear}😎"
      echo -e "================================================================="
      source ./run
        ;;
      [Nn])
      echo -e "${BCyan}Database Not Deleted${clear}"
      echo -e "================================================================="
      source ./run
       ;;  
    *)
        echo -e "${Red}Invalid Input Try Again${clear}"
        echo -e "================================================================="
        source ./DropDb.sh
        ;;
       esac 
done

