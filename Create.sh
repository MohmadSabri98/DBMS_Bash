#! /bin/bash
#stty 
echo -e "${BBlue}===============Create Database===============${clear}"
read -rp "Enter Database Name: " name
while [[ -z $name ]] || [[ $name == *['!''@#/$\"*{^})(+|,;:~`._%&/=-]>[<?']* ]] || [[ $name =~ [0-9] ]]
do 
            echo -e "${Red}Invalid Input🤡${clear}"
            read -rp "PLease Enter Database Name Again:🧐" name
done
if [ -d ./DBs/$name ] 
then
    echo -e "${Red}database already exists🙂${clear}"
    echo -e "================================================================="
    source ./Create.sh
fi
mkdir ./DBs/$name  
echo -e "${BYellow}Congratulations Your Database Is Created😎${clear}"	
echo -e "================================================================="
source ./run