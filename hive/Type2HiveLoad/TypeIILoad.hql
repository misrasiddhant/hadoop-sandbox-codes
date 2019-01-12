drop table poc.TypeIITable_EXT;
create table poc.TypeIITable_EXT(
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

LOAD DATA LOCAL INPATH '/root/data/datafile2.csv' OVERWRITE INTO TABLE poc.TypeIITable_EXT;

INSERT OVERWRITE TABLE poc.TypeIITable select a.col1, a.col2, a.col3, case when b.col1 is NULL THEN 'N' ELSE 'Y' end, a.eff_from, case when b.col1 is null then '2020-01-01' else a.eff_to end from poc.typeiitable a left outer join poc.typeiitable_ext b on a.col1=b.col1;

INSERT INTO poc.TypeIITable select * from poc.TypeIITable_EXT;
