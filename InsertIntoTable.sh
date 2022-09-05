#! /bin/bash
if [ $(ls ./DBs/$dbname | wc -l) == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      
echo -e "${BPurple}===============Insert Into Table===============${clear}\n"
re='^[0-9]+$'
read -rp "Enter Table You Want To Insert : " tablename

while [[ -z $tablename ]] || [[ $tablebname == *['!''@#/$\"*{^})(+_/|,;:~`.%&.=-]>[<?']* ]]
do 
    echo -e "${Red}Invalid Input${clear}🤡"
    read -rp "PLease Enter Table Name Again:🧐" tablename
done
declare -a valueofcnamearray

if [ -f ./DBs/$dbname/$tablename ]   # dont forget to add .type
then
    echo -e "${BBlue}*****Primary key must be unique*****${clear}"
    #iterate on tablename.type to know the number of fields to insert in it
   numofcul=$(awk -F" " '{
    if (NR=="1")  {print NF}
    }' ./DBs/$dbname/$tablename.Type)
    for (( j=0 ; j < $numofcul; j++ ))
    do
read -rp "Enter Value Of $(head -n 1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ") column: " valueofcname
## check datatype of record
      datatype=$(tail -1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ")
       if [[ "$datatype" == "int" ]] 
       then 
           while ! [[ $valueofcname =~ $re ]]
           do
             echo -e "${BBlue}Column must be integer${clear}"
             read -rp "Enter Value Of $(head -n 1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ") column: " valueofcname
      
           done
       fi 
          if [[ "$datatype" == "string" ]] 
       then 
           while  [[ $valueofcname =~ $re ]] || [[ -z $valueofcname ]] || [[ $valueofcname == *['!''@#/$\"*{^})(+_|,;:~`.%&/=-]>[<?']* ]]
           do
              echo -e "${BBlue}Column must be string and not contained spaces or special charcters *^%\/  ${clear}"
              read -rp "Enter Value Of $(head -n 1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ") column: " valueofcname
        
            done
        fi
   
        ###########check primary key
      
   pkvalue=$(cut -f 1 -d " " ./DBs/$dbname/$tablename | grep -w $valueofcname)
        while [[ $pkvalue == $valueofcname ]]&& [[ $j == 0 ]]
        do 
           echo -e "${Red}This Value is Already Exists (Pk)${clear}" 
           echo -e "================================================================="
           read -rp "Enter Value Of $(head -n 1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ") column: " valueofcname  
        if [[ "$datatype" == "int" ]] 
       then 
    
           while ! [[ $valueofcname =~ $re ]]
           do
             echo -e "${BBlue}Column must be integer${clear}"
             read -rp "Enter Value Of $(head -n 1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ") column: " valueofcname
      
           done
       fi 
          if [[ "$datatype" == "string" ]] 
       then 
           while  [[ $valueofcname =~ $re ]] || [[ -z $valueofcname ]] || [[ $valueofcname == *['!''@#/$\"*{^})(+_|,;:~`.%&/=-]>[<?']* ]]
           do
              echo -e "${BBlue}Column must be string${clear}"
              read -rp "Enter Value Of $(head -n 1 ./DBs/$dbname/$tablename.Type  | cut -f $((j+1)) -d " ") column: " valueofcname
        
            done
        fi
           pkvalue=$(cut -f 1 -d " " ./DBs/$dbname/$tablename | grep -w $valueofcname)
        done        


valueofcnamearray[$j]=$valueofcname
done

#take the array and pass it to the file
    echo "${valueofcnamearray[@]}" >> ./DBs/$dbname/$tablename
    unset valueofcnamearray
    # echo "" >> ./DBs/$dbname/$tablename
    else
        echo -e "${Red}Table Not Exists${clear}"
        echo -e "================================================================="
        source ./Connect-Menu.sh
fi
echo -e "${BYellow}Insertion Complete${clear}"
echo -e "================================================================="
source ./Connect-Menu.sh