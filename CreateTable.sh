#! /bin/bash

echo -e "${BPurple}===============Create Table===============${clear}\n"

declare -a cnamearray 
declare -a ctypearray 
re='^[0-9]+$'

read -rp "Enter Table name🤔" tbname
while [[ -z $tbname ]] ||  [[ $tbname == *['!''@#/$\"*{^})(+_/|,;:~`.%&.=-]>[<?']* ]] || [[ $tbname =~ [0-9] ]]
do 
    echo -e "${Red}Invalid Input${clear}"
    read -rp "PLease Enter Table Name Again:🧐" tbname
done

while [ -f ./DBs/$dbname/$tbname ] 
do
    echo -e "${Red}Table Already Exists${clear}🙂"
    source ./CreateTable.sh
done
#read column number from user
read -rp "Enter Number Of Columns: " cnumber
# function to check validation of cnumber
function valcnumber()
{
  if ! [[ $cnumber =~ $re ]]
  then
    echo -e "${Red}Invalid Input It Must Be A Number${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
  fi   
}
valcnumber                    #calling function
export cnumber

echo -e "${BBlue}*****First Column Must Be Primary Key*****${clear}"
touch ./DBs/$dbname/$tbname 
# to enter the columns name with input column numbers
for (( i=0 ; i < $cnumber ; i++ ))
do
  read -p "Enter Name of column $((i+1)): " cname
  while [[ -z $cname ]] || [[ $cname == *['!''@#/$\"*{^})(+_/|,;:~`.%&=-]>[<?']* ]] || [[ $cname =~ $re ]]
  do 
    echo -e "${Red}Invalid Input${clear}🤡"
    read -rp "PLease Enter column Name Again:🧐" cname
  done
 
  ##### check if the cname is exists or not 
  while [[ "${cnamearray[*]}" =~ "$cname" ]]
  do
    echo -e "${Red}This name is already exists${clear}"
    read -rp "PLease Enter column Name Again:🧐" cname
  done
   #enter datatype     
  read -rp "Enter DataType of column $((i+1)): [string/int] " ctype  
  #check on datatype
  while [[ $ctype != int ]] && [[ $ctype != string ]] 
  do
    echo -e "${Red}Invalid DataType${clear}"   
    read -rp "Enter DataType of column $((i+1)): [string/int] " ctype
  done
        
        cnamearray[$i]=$cname
        ctypearray[$i]=$ctype

done

echo
echo  "${cnamearray[@]}" >> ./DBs/$dbname/$tbname.Type
echo "${ctypearray[@]}" >> ./DBs/$dbname/$tbname.Type


echo -e "${BYellow}Congratulations Your Table Is Created${clear}😎"
echo -e "================================================================="
source ./Connect-Menu.sh