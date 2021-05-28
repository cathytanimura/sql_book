-- Trending the data
-- Simple trends

SELECT sales_month
,sales
FROM retail_sales
WHERE kind_of_business = 'Retail and food services sales, total'
ORDER BY 1
;

SELECT date_part('year',sales_month) as sales_year
,sum(sales) as sales
FROM retail_sales
WHERE kind_of_business = 'Retail and food services sales, total'
GROUP BY 1
ORDER BY 1
;

-- Comparing components
SELECT date_part('year',sales_month) as sales_year
,kind_of_business
,sum(sales) as sales
FROM retail_sales
WHERE kind_of_business in ('Book stores','Sporting goods stores','Hobby, toy, and game stores')
GROUP BY 1,2
ORDER BY 1,2
;

SELECT sales_month
,kind_of_business
,sales
FROM retail_sales
WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
ORDER BY 1,2
;

SELECT date_part('year',sales_month) as sales_year
,kind_of_business
,sum(sales) as sales
FROM retail_sales
WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
GROUP BY 1,2
;

SELECT date_part('year',sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' then sales end) as womens_sales
,sum(case when kind_of_business = 'Men''s clothing stores' then sales end) as mens_sales
FROM retail_sales
WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
GROUP BY 1
ORDER BY 1
;

SELECT sales_year
,womens_sales - mens_sales as womens_minus_mens
,mens_sales - womens_sales as mens_minus_womens
FROM
(
        SELECT date_part('year',sales_month) as sales_year
        ,sum(case when kind_of_business = 'Women''s clothing stores' then sales end) as womens_sales
        ,sum(case when kind_of_business = 'Men''s clothing stores' then sales end) as mens_sales
        FROM retail_sales
        WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
        and sales_month <= '2019-12-01'
        GROUP BY 1
) a
ORDER BY 1
;

SELECT date_part('year',sales_month) as sales_year
,sum(case when kind_of_business = 'Women''s clothing stores' then sales end) 
 - sum(case when kind_of_business = 'Men''s clothing stores' then sales end) as womens_minus_mens
FROM retail_sales
WHERE kind_of_business in ('Men''s clothing stores'
 ,'Women''s clothing stores')
and sales_month <= '2019-12-01'
GROUP BY 1
ORDER BY 1
;

SELECT sales_year
,womens_sales / mens_sales as womens_times_of_mens
FROM
(
        SELECT date_part('year',sales_month) as sales_year
        ,sum(case when kind_of_business = 'Women''s clothing stores' then sales end) as womens_sales
        ,sum(case when kind_of_business = 'Men''s clothing stores' then sales end) as mens_sales
        FROM retail_sales
        WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
        and sales_month <= '2019-12-01'
        GROUP BY 1
) a
ORDER BY 1
;

SELECT sales_year
,(womens_sales / mens_sales - 1) * 100 as womens_pct_of_mens
FROM
(
        SELECT date_part('year',sales_month) as sales_year
        ,sum(case when kind_of_business = 'Women''s clothing stores' 
                  then sales 
                  end) as womens_sales
        ,sum(case when kind_of_business = 'Men''s clothing stores' 
                  then sales 
                  end) as mens_sales
        FROM retail_sales
        WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
        and sales_month <= '2019-12-01'
        GROUP BY 1
) a
ORDER BY 1
;

-- Percent of total calculations
SELECT sales_month
,kind_of_business
,sales * 100 / total_sales as pct_total_sales
FROM
(
        SELECT a.sales_month
        ,a.kind_of_business
        ,a.sales
        ,sum(b.sales) as total_sales
        FROM retail_sales a
        JOIN retail_sales b on a.sales_month = b.sales_month
        and b.kind_of_business in ('Men''s clothing stores'
         ,'Women''s clothing stores')
        WHERE a.kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
        GROUP BY 1,2,3
) aa
ORDER BY 1,2
;

SELECT sales_month
,kind_of_business
,sales
,sum(sales) over (partition by sales_month) as total_sales
,sales * 100 / sum(sales) over (partition by sales_month) as pct_total
FROM retail_sales 
WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
ORDER BY 1
;

SELECT sales_month
,kind_of_business
,sales * 100 / yearly_sales as pct_yearly
FROM
(
        SELECT a.sales_month
        ,a.kind_of_business
        ,a.sales
        ,sum(b.sales) as yearly_sales
        FROM retail_sales a
        JOIN retail_sales b on date_part('year',a.sales_month) = date_part('year',b.sales_month)
        and a.kind_of_business = b.kind_of_business
        and b.kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
        WHERE a.kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
        GROUP BY 1,2,3
) aa
ORDER BY 1,2
;

SELECT sales_month, kind_of_business, sales
,sum(sales) over (partition by date_part('year',sales_month), kind_of_business) as yearly_sales
,sales * 100 / sum(sales) over (partition by date_part('year',sales_month), kind_of_business) as pct_yearly
FROM retail_sales 
WHERE kind_of_business in ('Men''s clothing stores','Women''s clothing stores')
ORDER BY 1,2
;

SELECT sales_year, sales
,first_value(sales) over (order by sales_year) as index_sales
FROM
(
    SELECT date_part('year',sales_month) as sales_year
    ,sum(sales) as sales
    FROM retail_sales
    WHERE kind_of_business = 'Women''s clothing stores'
    GROUP BY 1
) a
;


