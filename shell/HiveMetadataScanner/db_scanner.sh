warehouse_path="/apps/hive/warehouse/"
folders="`hadoop fs -ls $warehouse_path/*`"
IFS=$'\n'
#rm tables.txt
rm tables.hql
for file in $folders
do
 if [[ $file == *"$warehouse_path"* ]];then
  #echo $file
  table="$(echo $file | rev | cut -d '/' -f1 | rev)"
  database="$(echo $file | rev | cut -d '/' -f2 | rev)"
  echo "describe ${database/".db"/}.$table;" >> tables.hql
   
 fi
done

`hive -f tables.hql` &>tableddl.txt

