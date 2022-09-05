#! /bin/bash

#check if the table empty
if [[ `cat ./DBs/$dbname/$tablename | wc -l` == 0 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi    

echo -e "${BCyan}===============All Records===============${clear}\n"
echo -e "================================================================="

#value of $1 is assigned to field $1, 
#awk actually rebuilds its $0 by concatenating them with default field delimiter(or OFS) space.

head -n 1 ./DBs/$dbname/$tablename.Type 
#cat ./database/$dbname/$tablename.Type
echo -e "${BCyan}-----------------------------------------------------------------${clear}"
#New Delimeter
cat ./DBs/$dbname/$tablename
#cat ./database/$dbname/$tablename
echo -e "================================================================="
source ./Connect-Menu.sh