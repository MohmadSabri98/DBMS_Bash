#! /bin/bash

#check if the table empty
read -rp "enter table name " tablename
if [[ `cat ./DBs/$dbname/$tablename | wc -l` == 0 ]]
then 
    echo -e "${Red}Table empty or table Doesn't exist ${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi    
echo -e "${BCyan}===============Select Record===============${clear}\n"


read -p "selcet  a record :" record
while [[ -z $record ]]
do 
    echo -e "${Red}Invalid Input${clear}🤡"
    read -rp "PLease Enter PK Record Again:🧐" record
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

function checkexistwhereval(){
numofcol=$1 
whereval=$2
m=$(awk -F " " '{


if($("'$numofcol'")== "'$whereval'")
{print "yes";}

	


}' ./DBs/$dbname/$tablename)
if [[ $m != " " ]]
then
echo "true"
else 
echo "false"
fi
}


recordum=$(checkcolnum $record)

read -rp "where val =  " recordval
echo -e "================================================================="
head -1 ./DBs/$dbname/$tablename.Type
echo -e "${BCyan}-----------------------------------------------------------------${clear}"
# if [[ $recordval =~ [`cut -d':' -f$recordum ./DBs/$dbname/$tablename | grep -x $recordval`] ]]; then
zz=$(checkexistwhereval $recordum $recordval)
if [[ "$zz" == "true" ]]
then

declare -a arr
arr=`awk -F " " '{


	if($("'$recordum'")=="'$recordval'")
	{
       print NR 
      
    }
	


}' ./DBs/$dbname/$tablename`
for i in `echo ${arr[@]}`
do

#echo $i
sed   -n ''$i''p ./DBs/$dbname/$tablename   


done
echo -e "${BCyan}-----------------------------------------------------------------${clear}"
source ./Connect-Menu.sh 
else              
    echo -e "${Red}Record Not Found${clear}"
    source ./SelectRecord.sh               
fi

























