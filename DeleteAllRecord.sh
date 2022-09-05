#! /bin/bash
read -p "enter table name" tablename
if [[ `cat ./DBs/$dbname/$tablename | wc -l` == 0 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi  
rm ./DBs/$dbname/$tablename
touch ./DBs/$dbname/$tablename
echo -e "${BYellow}Record Deleted successfully${clear}"

echo -e "================================================================="

source ./Connect-Menu.sh