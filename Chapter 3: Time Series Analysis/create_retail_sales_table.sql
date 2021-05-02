-- create the table
DROP table if exists retail_sales;
CREATE table retail_sales
(
sales_month date
,naics_code varchar
,kind_of_business varchar
,reason_for_null varchar
,sales int
)
;

-- populate the table with data from the csv file. Download the file locally before completing this step
COPY retail_sales 
FROM 'localpath/us_retail_sales.csv' -- change to the location you saved the csv file
DELIMITER ','
CSV HEADER
;
