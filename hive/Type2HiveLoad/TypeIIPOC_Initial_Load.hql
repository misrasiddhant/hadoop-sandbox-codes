drop table poc.TypeIITable;
create table poc.TypeIITable(
   col1 string,
   col2 string,
   col3 string,
   crnt string,
   eff_from string,
   eff_to string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/root/data/datafile1.csv' OVERWRITE INTO TABLE poc.TypeIITable;

