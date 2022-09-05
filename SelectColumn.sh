#! /bin/bash

#check if the table empty
if [[ `cat ./DBs/$dbname/$tablename | wc -l` == 0 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi    
read -rp "Enter Column Name You Want To Select: " colname
while [[ -z $colname ]]
do 
            echo -e "${Red}Invalid Input${clear}🤡"
            read -rp "PLease Enter Column Name Again:🧐" colname
done  
function checkcolnum(){
rr=$1
m=$(awk -F " " '{
if(NR==1){	
for(i=1;i<=NF;i++)
{
	if($i=="'$rr'")
	{print i;break}
	
}
}
}' ./DBs/$dbname/$tablename.Type)
if [[ $m != "" ]]
then
echo $m
else 
echo "false"
fi
}
cc=$(checkcolnum $colname)
head -1 ./DBs/$dbname/$tablename.Type | cut -f $cc -d " "
echo  -e "\n"
cat ./DBs/$dbname/$tablename | cut -f $cc -d " "
source ./Connect-Menu.sh 