DROP table if exists videogame_sales;
CREATE table videogame_sales
(
rank int
,name varchar
,platform varchar
,year int
,genre varchar
,publisher varchar
,na_sales decimal
,eu_sales decimal
,jp_sales decimal
,other_sales decimal
,global_sales decimal
)
;

-- change localpath to the location of the saved file
COPY videogame_sales FROM 'localpath/videogame_sales.csv' DELIMITER ',' CSV HEADER;
