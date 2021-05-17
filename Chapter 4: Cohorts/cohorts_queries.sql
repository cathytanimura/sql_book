SELECT id_bioguide
,min(term_start) as first_term
FROM legislators_terms 
GROUP BY 1
;

SELECT date_part('year',age(b.term_start,a.first_term)) as periods
,count(distinct a.id_bioguide) as cohort_retained
FROM
(
        SELECT id_bioguide
        ,min(term_start) as first_term
        FROM legislators_terms 
        GROUP BY 1
) a
JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
GROUP BY 1
;

SELECT period
,first_value(cohort_retained) over (order by period) as cohort_size
,cohort_retained
,cohort_retained * 100.0 / 
 first_value(cohort_retained) over (order by period) 
 as pct_retained
FROM
(
        SELECT date_part('year',age(b.term_start,a.first_term)) as period
        ,count(distinct a.id_bioguide) as cohort_retained
        FROM
        (
                SELECT id_bioguide
                ,min(term_start) as first_term
                FROM legislators_terms 
                GROUP BY 1
        ) a
        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
        GROUP BY 1
) aa
;

SELECT cohort_size
,max(case when period = 0 then pct_retained end) as yr0
,max(case when period = 1 then pct_retained end) as yr1
,max(case when period = 2 then pct_retained end) as yr2
,max(case when period = 3 then pct_retained end) as yr3
,max(case when period = 4 then pct_retained end) as yr4
FROM
(
        SELECT period
        ,first_value(cohort_retained) 
          over (order by period) as cohort_size
        ,cohort_retained
        ,round(cohort_retained * 100.0 
         / 
         first_value(cohort_retained) 
           over (order by period),2) as pct_retained
        FROM
        (
                SELECT 
                date_part('year',age(b.term_start,a.first_term)) as period
                ,count(*) as cohort_retained
                FROM
                (
                        SELECT id_bioguide
                        ,min(term_start) as first_term
                        FROM legislators_terms 
                        GROUP BY 1
                ) a
                JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
                GROUP BY 1
        ) aa
) aaa
GROUP BY 1
;

SELECT first_year
,period
,first_value(cohort_retained) over (partition by first_year order by period) as cohort_size
,cohort_retained
,round(cohort_retained * 100.0 / first_value(cohort_retained) over (partition by first_year order by period),2) as pct_retained
FROM
(
        SELECT date_part('year',first_term) as first_year
        ,date_part('year',age(b.term_start,a.first_term)) as period
        ,count(distinct a.id_bioguide) as cohort_retained
        FROM
        (
                SELECT id_bioguide
                ,min(term_start) as first_term
                FROM legislators_terms 
                GROUP BY 1
        ) a
        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
        GROUP BY 1,2
) aa
;

SELECT first_century
,cohort_size
,max(case when period = 5 then pct_retained end) as yr5
,max(case when period = 10 then pct_retained end) as yr10
,max(case when period = 15 then pct_retained end) as yr15
,max(case when period = 20 then pct_retained end) as yr20
FROM
(
        SELECT first_century
        ,period
        ,first_value(cohort_retained) over (partition by first_century order by period) as cohort_size
        ,cohort_retained
        ,round(cohort_retained * 100.0 / first_value(cohort_retained) over (partition by first_century order by period),2) as pct_retained
        FROM
        (
                SELECT date_part('century',first_term) as first_century
                ,date_part('year',age(b.term_start,a.first_term)) as period
                ,count(distinct a.id_bioguide) as cohort_retained
                FROM
                (
                        SELECT id_bioguide, min(term_start) as first_term
                        FROM legislators_terms 
                        GROUP BY 1
                ) a
                JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
                GROUP BY 1,2
        ) aa
) aaa
GROUP BY 1,2
;

SELECT date_part('year',first_term) as first_year
,count(id_bioguide) as reps
FROM
(
        SELECT id_bioguide, min(term_start) as first_term
        FROM legislators_terms
        WHERE term_type = 'rep'
        GROUP BY 1
) a
GROUP BY 1
;

SELECT first_year
,period
,first_value(cohort_retained) over (partition by first_year 
                                    order by period) as cohort_size
,cohort_retained
,round(cohort_retained * 100.0 
 / 
 first_value(cohort_retained) over (partition by first_year 
                                    order by period)
 ,2) as pct_retained
FROM
(
        SELECT date_part('year',first_term) as first_year
        ,date_part('year',age(b.term_start,a.first_term)) as period
        ,count(distinct a.id_bioguide) as cohort_retained
        FROM
        (
                SELECT id_bioguide, min(term_start) as first_term
                FROM legislators_terms 
                GROUP BY 1
        ) a
        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
        GROUP BY 1,2
) aa
WHERE first_year between 1989 and 1997
and mod(first_year::int,2) = 1
;

SELECT date_part('day',term_start) as term_start_day
,count(*) as terms
FROM legislators_terms
WHERE date_part('month',term_start) = 1
GROUP BY 1
ORDER BY 1
limit 7
;

SELECT id_bioguide
,term_start
,prev_start
,date_part('year',age(date_trunc('month',term_start),date_trunc('month',prev_start))) as years
FROM
(
        SELECT id_bioguide
        ,term_start
        ,lag(term_start) over (partition by id_bioguide 
                               order by term_start) 
                               as prev_start
        FROM legislators_terms
) a
;

SELECT first_year
,period
,first_value(cohort_retained) over (partition by first_year order by period) as cohort_size
,cohort_retained
,round(cohort_retained * 100.0 / first_value(cohort_retained) over (partition by first_year order by period),2) as pct_retained
FROM
(
        SELECT date_part('year',first_term) as first_year    
        ,date_part('year'
                   ,age(date_trunc('month',b.term_start)
                   ,date_trunc('month',a.first_term))
                   ) as period
        ,count(distinct a.id_bioguide) as cohort_retained
        FROM
        (
                SELECT id_bioguide, min(term_start) as first_term
                FROM legislators_terms 
                GROUP BY 1
        ) a
        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
        GROUP BY 1,2
) aa
WHERE first_year between 1989 and 1997
and mod(first_year::int,2) = 1
;

SELECT a.id_bioguide
,a.first_term
,b.term_start
,lead(b.term_start) over (partition by b.id_bioguide order by b.term_start) as next_start
FROM
(
        SELECT id_bioguide, min(term_start) as first_term
        FROM legislators_terms 
        GROUP BY 1
) a
JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
;

SELECT distinct aa.id_bioguide
,aa.first_term
,aa.term_start
,aa.next_start
,bb.date
,date_part('year',age(bb.date,aa.first_term)) as period
FROM
(
        SELECT a.id_bioguide
        ,a.first_term
        ,b.term_start
        ,lead(b.term_start) over (partition by b.id_bioguide order by b.term_start) as next_start
        FROM
        (
                SELECT id_bioguide, min(term_start) as first_term
                FROM legislators_terms 
                GROUP BY 1
        ) a
        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
) aa
LEFT JOIN date_dim bb 
on bb.date between aa.term_start and aa.next_start 
and bb.month_name = 'December' 
and bb.day_of_month = 31
;

SELECT first_year
,period
,first_value(cohort_retained) over (partition by first_year 
                                    order by period
                                    ) as cohort_size
,cohort_retained
,round(cohort_retained * 100.0 
 / 
 first_value(cohort_retained) over (partition by first_year 
                                    order by period)
 ,2) as pct_retained
FROM
(
        SELECT date_part('year',aaa.first_term) as first_year
        ,coalesce(aaa.period,0) as period
        ,count(distinct aaa.id_bioguide) as cohort_retained
        FROM
        (
                SELECT distinct aa.id_bioguide
                ,aa.first_term
                ,date_part('year',age(bb.date,aa.first_term)) as period
                FROM
                (
                        SELECT a.id_bioguide
                        ,a.first_term
                        ,b.term_start
                        ,lead(b.term_start) over (partition by b.id_bioguide 
                                                  order by b.term_start
                                                  ) as next_start
                        FROM
                        (
                                SELECT id_bioguide, min(term_start) as first_term
                                FROM legislators_terms 
                                GROUP BY 1
                        ) a
                        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
                ) aa
                LEFT JOIN date_dim bb 
                on bb.date between aa.term_start and aa.next_start 
                and bb.month_name = 'December' and bb.day_of_month = 31
        ) aaa
        GROUP BY 1,2
) aaaa
WHERE first_year between 1989 and 1997
and mod(first_year::int,2) = 1
;

SELECT first_year, period
,first_value(cohort_retained) over (partition by first_year order by period) as cohort_size
,cohort_retained
,round(cohort_retained * 100.0 / first_value(cohort_retained) over (partition by first_year order by period),2) as pct_retained
FROM
(
        SELECT date_part('year',first_term) as first_year
        ,coalesce(period,0) as period
        ,count(distinct id_bioguide) as cohort_retained
        FROM
        (
                SELECT distinct aa.id_bioguide, aa.first_term
                ,date_part('year',age(bb.date,aa.first_term)) as period
                FROM
                (
                        SELECT a.id_bioguide, a.first_term
                        ,b.term_start, b.term_end
                        FROM
                        (
                                SELECT id_bioguide, min(term_start) as first_term
                                FROM legislators_terms 
                                GROUP BY 1
                        ) a
                        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
                ) aa
                LEFT JOIN date_dim bb 
                on bb.date between aa.term_start and aa.term_end 
                and bb.month_name = 'December' and bb.day_of_month = 31
        ) aaa
        GROUP BY 1,2
) aaaa
WHERE first_year between 1989 and 1997
and mod(first_year::int,2) = 1
;

----------- Defining the cohort from a separate table ----------------------------------
SELECT a.id_bioguide
,a.first_term
,b.term_start
,b.term_end
,c.gender
FROM
(
        SELECT id_bioguide
        ,min(term_start) as first_term
        FROM legislators_terms 
        GROUP BY 1
) a
JOIN legislators_terms b on a.id_bioguide = b.id_bioguide
JOIN legislators c on a.id_bioguide = c.id_bioguide 
;









