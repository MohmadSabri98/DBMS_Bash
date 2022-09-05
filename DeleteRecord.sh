#! /bin/bash
read -rp "enter table name" tablename
if [[ `cat ./DBs/$dbname/$tablename | wc -l` == 0 ]]
then 
    echo -e "${Red}Table empty${clear}"
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi  


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

read -rp "where colum name " colname
read -rp " and col val " colvl


zp=$(checkcolnum $colname)
#echo $zp
declare -a arr
arr=`awk -F " " '{


	if($("'$zp'")!="'$colvl'")
	{
       print NR 
      
    }
	


}' ./DBs/$dbname/$tablename`
#echo ${arr[@]}
touch  ./DBs/$dbname/tmp
echo "___________________________________"

for i in `echo ${arr[@]}`
do

#echo $i
sed   -n ''$i''p ./DBs/$dbname/$tablename >> ./DBs/$dbname/tmp   


 
#sed -i ''$i'd' ./DBs/$dbname/$tablename 

done
cp ./DBs/$dbname/tmp ./DBs/$dbname/$tablename
rm -r ./DBs/$dbname/tmp
 echo -e "${BYellow}Record deleted successfuly${clear}"
            echo -e "================================================================="
            source ./Connect-Menu.sh


