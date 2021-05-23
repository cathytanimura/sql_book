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

SELECT gender, cohort_size
,max(case when period = 0 then pct_retained end) as yr0
,max(case when period = 2 then pct_retained end) as yr2
,max(case when period = 4 then pct_retained end) as yr4
,max(case when period = 6 then pct_retained end) as yr6
,max(case when period = 8 then pct_retained end) as yr8
,max(case when period = 10 then pct_retained end) as yr10
FROM
(
        SELECT gender, period
        ,first_value(cohort_retained) over (partition by gender order by period) as cohort_size
        ,cohort_retained
        ,round(cohort_retained * 100.0 / first_value(cohort_retained) over (partition by gender order by period),1) as pct_retained
        FROM
        (
                SELECT gender, coalesce(period,0) as period
                ,count(distinct aaa.id_bioguide) as cohort_retained
                FROM
                (
                        SELECT distinct aa.id_bioguide, aa.gender, aa.first_term
                        ,date_part('year',age(bb.date,aa.first_term)) as period
                        FROM
                        (
                                SELECT a.id_bioguide, a.first_term
                                ,b.term_start, b.term_end, c.gender
                                FROM
                                (
                                        SELECT id_bioguide, min(term_start) as first_term
                                        FROM legislators_terms 
                                        GROUP BY 1
                                ) a
                                JOIN legislators_terms b on a.id_bioguide = b.id_bioguide
                                JOIN legislators c on a.id_bioguide = c.id_bioguide 
                        ) aa
                        LEFT JOIN date_dim bb on bb.date between aa.term_start and aa.term_end and bb.month_name = 'December' and bb.day_of_month = 31
                ) aaa
                GROUP BY 1,2
        ) aaaa
) aaaaa
GROUP BY 1,2
;

----------- Dealing with sparse cohorts ----------------------------------

SELECT gender
,state
,cohort_size as cohort
,max(case when period = 0 then pct_retained end) as yr0
,max(case when period = 2 then pct_retained end) as yr2
,max(case when period = 4 then pct_retained end) as yr4
,max(case when period = 6 then pct_retained end) as yr6
,max(case when period = 8 then pct_retained end) as yr8
,max(case when period = 10 then pct_retained end) as yr10
FROM
(
        SELECT gender, state, period
        ,first_value(cohort_retained) over (partition by gender, state order by period) as cohort_size
        ,cohort_retained
        ,round(cohort_retained * 100.0 / first_value(cohort_retained) over (partition by gender, state order by period),1) as pct_retained
        FROM
        (
                SELECT gender, state, coalesce(period,0) as period
                ,count(distinct id_bioguide) as cohort_retained
                FROM
                (
                        SELECT distinct aa.id_bioguide, aa.gender, aa.state, aa.first_term
                        ,date_part('year',age(bb.date,aa.first_term)) as period
                        FROM
                        (
                                SELECT a.id_bioguide, a.first_term,b.term_start, b.term_end, b.state, c.gender
                                FROM
                                (
                                        SELECT id_bioguide
                                        ,min(term_start) as first_term
                                        FROM legislators_terms 
                                        GROUP BY 1
                                ) a
                                JOIN legislators_terms b on a.id_bioguide = b.id_bioguide
                                JOIN legislators c on a.id_bioguide = c.id_bioguide and c.gender = 'F'
                        ) aa
                        LEFT JOIN date_dim bb on bb.date between aa.term_start and aa.term_end and bb.month_name = 'December' and bb.day_of_month = 31
                ) aaa
                WHERE first_term between '1917-01-01' and '2009-12-31' 
                GROUP BY 1,2,3
        ) aaaa
) aaaaa
GROUP BY 1,2,3
;

SELECT aa.gender, aa.state, cc.period, aa.cohort
FROM
(
        SELECT a.gender, b.state
        ,count(distinct a.id_bioguide) as cohort
        FROM legislators a
        JOIN 
        (
                SELECT id_bioguide, state, min(term_start) as first_term
                FROM legislators_terms 
                GROUP BY 1,2
        ) b on a.id_bioguide = b.id_bioguide
        WHERE a.gender = 'F'
        and first_term between '1917-01-01' and '2009-12-31' 
        GROUP BY 1,2
) aa
JOIN
(
        SELECT distinct date_part('year',age(d.term_start,c.term_start))::int 
        as period
        FROM legislators_terms c
        JOIN legislators_terms d on c.id_bioguide = d.id_bioguide 
        and c.term_start < d.term_start
) cc on 1 = 1
WHERE cc.period <= 20
;

SELECT aaa.gender, aaa.state, aaa.period, aaa.cohort
,coalesce(eeee.cohort_retained,0) as cohort_retained
,round(coalesce(eeee.cohort_retained,0) * 100.0 / aaa.cohort,1) as pct_retained
FROM
(
        SELECT aa.gender, aa.state, bb.period, aa.cohort
        FROM
        (
                SELECT a.gender, b.state
                ,count(distinct a.id_bioguide) as cohort
                FROM legislators a
                JOIN 
                (
                        SELECT id_bioguide, state, min(term_start) as first_term
                        FROM legislators_terms 
                        GROUP BY 1,2
                ) b on a.id_bioguide = b.id_bioguide
                WHERE a.gender = 'F'
                and first_term between '1917-01-01' and '2009-12-31' 
                GROUP BY 1,2
        ) aa
        JOIN
        (
                SELECT distinct date_part('year',age(d.term_start,c.term_start))::int as period
                FROM legislators_terms c
                JOIN legislators_terms d on c.id_bioguide = d.id_bioguide and c.term_start < d.term_start
        ) bb on 1 = 1
        WHERE bb.period <= 20
) aaa
LEFT JOIN
(
        SELECT gender, state, coalesce(period,0) as period
        ,count(distinct id_bioguide) as cohort_retained
        FROM
        (
                SELECT distinct ee.id_bioguide, ee.gender, ee.state, ee.first_term
                ,date_part('year',age(ff.date,ee.first_term)) as period
                FROM
                (
                        SELECT e.id_bioguide, e.first_term, f.term_start, f.term_end, g.gender, f.state
                        FROM
                        (
                                SELECT id_bioguide, min(term_start) as first_term
                                FROM legislators_terms 
                                GROUP BY 1
                        ) e
                        JOIN legislators_terms f on e.id_bioguide = f.id_bioguide
                        JOIN legislators g on e.id_bioguide = g.id_bioguide  and g.gender = 'F'
                ) ee
                LEFT JOIN date_dim ff on ff.date between ee.term_start and ee.term_end and ff.month_name = 'December' and ff.day_of_month = 31
        ) eee
        WHERE first_term between '1917-01-01' and '2009-12-31' 
        GROUP BY 1,2,3
) eeee on aaa.gender = eeee.gender and aaa.state = eeee.state 
and aaa.period = eeee.period
;

----------- Defining cohorts from dates other than the first date ----------------------------------

SELECT id_bioguide, term_type
,min(term_start) as base_date
FROM legislators_terms 
WHERE term_start <= '2000-12-31' and term_end >= '2000-01-01'
GROUP BY 1,2
;

SELECT a.id_bioguide
,a.term_type
,a.base_date          
,make_date(2000,date_part('month', base_date)::int, date_part('day',base_date)::int) as base_term
,b.term_start
,b.term_end
FROM
(
        SELECT id_bioguide, term_type
        ,min(term_start) as base_date
        FROM legislators_terms 
        WHERE term_start <= '2000-12-31' and term_end >= '2000-01-01'
        GROUP BY 1,2
) a
JOIN legislators_terms b on a.id_bioguide = b.id_bioguide 
and b.term_start >= a.base_date
;

SELECT term_type, period
,first_value(cohort_retained) over (partition by term_type order by period) as cohort
,cohort_retained
,cohort_retained * 100.0 / first_value(cohort_retained) over (partition by term_type order by period)
 as pct_retained
FROM
(
        SELECT term_type, coalesce(period,0) as period
        ,count(distinct id_bioguide) as cohort_retained
        FROM
        (
                SELECT distinct aa.id_bioguide, aa.term_type, aa.base_term
                ,date_part('year',age(bb.date,aa.base_term))::int as period
                FROM
                (
                        SELECT a.id_bioguide, a.term_type, a.base_date           
                        ,make_date(2000, date_part('month',base_date)::int, date_part('day',base_date)::int) as base_term
                        ,b.term_start, b.term_end
                        FROM
                        (
                                SELECT id_bioguide, term_type
                                ,min(term_start) as base_date
                                FROM legislators_terms 
                                WHERE term_start <= '2000-12-31'
                                and term_end >= '2000-01-01'
                                GROUP BY 1,2
                        ) a
                        JOIN legislators_terms b on a.id_bioguide = b.id_bioguide and b.term_start >= a.base_date
                ) aa
                LEFT JOIN date_dim bb on bb.date between aa.term_start and aa.term_end 
                and bb.year >= 2000 and bb.month_name = 'December' and bb.day_of_month = 31 
        ) aaa
        GROUP BY 1,2
) aaaa
;

----------- Survivorship ----------------------------------
SELECT distinct id_bioguide
,first_value(term_start) over (partition by id_bioguide 
                               order by term_start
                               ) as first_term
,last_value(term_start) over (partition by id_bioguide 
                              order by term_start
                              ) as last_term
FROM legislators_terms
;

SELECT century
,count(distinct id_bioguide) as cohort
,count(distinct case when tenure >= 10 then id_bioguide  end) as survived_10
,count(distinct case when tenure >= 10 then id_bioguide end) * 100.0 / count(distinct id_bioguide) as pct_survived_10
FROM
(
        SELECT id_bioguide
        ,date_part('century',first_term)::int as century
        ,date_part('year',age(date_trunc('month',last_term), date_trunc('month',first_term))) as tenure
        FROM
        (
                SELECT distinct id_bioguide
                ,first_value(term_start) over (partition by id_bioguide order by term_start) as first_term
                ,last_value(term_start) over (partition by id_bioguide order by term_start) as last_term
                FROM legislators_terms
        ) a
) aa
GROUP BY 1
;

SELECT century, cohort, survived_10
,survived_10 * 100.0 / cohort as pct_survived_10
,survived_5_terms * 100.0 / cohort as pct_survived_5_terms 
FROM
(
        SELECT century
        ,count(distinct id_bioguide) as cohort
        ,count(distinct case when tenure >= 10 then id_bioguide end) as survived_10
        ,count(distinct case when total_terms >= 5 then id_bioguide end) as survived_5_terms
        FROM
        (
                SELECT id_bioguide
                ,date_part('century',first_term)::int as century
                ,date_part('year',age(date_trunc('month',last_term), date_trunc('month',first_term))) as tenure
                ,total_terms
                FROM
                (
                        SELECT distinct id_bioguide
                        ,first_value(term_start) over (partition by id_bioguide order by term_start) as first_term
                        ,last_value(term_start) over (partition by id_bioguide order by term_start) as last_term
                        ,count(term_start) over (partition by id_bioguide) as total_terms
                        FROM legislators_terms
                ) a
        ) aa
GROUP BY 1
) aaa
;

SELECT date_part('century',first_term)::int as century
,b.terms
,count(distinct id_bioguide) as cohort
,count(distinct case when a.total_terms >= b.terms then id_bioguide end) as cohort_survived
,count(distinct case when a.total_terms >= b.terms then id_bioguide end) * 100.0 / count(distinct id_bioguide) as pct_survived
FROM
(
        SELECT distinct id_bioguide
        ,first_value(term_start) over (partition by id_bioguide order by term_start) as first_term
        ,last_value(term_start) over (partition by id_bioguide order by term_start) as last_term
        ,count(term_start) over (partition by id_bioguide) as total_terms
        FROM legislators_terms
) a
JOIN
(
        SELECT generate_series as terms 
        FROM generate_series(1,20,1)
) b on 1 = 1
GROUP BY 1,2
;

----------- Returnship / repeat purchase behavior ----------------------------------
SELECT date_part('century',a.rep_start)::int as cohort_century
,count(id_bioguide) as reps
FROM
(
        SELECT id_bioguide, min(term_start) as rep_start
        FROM legislators_terms
        WHERE term_type = 'rep'
        GROUP BY 1
) a
GROUP BY 1
;

SELECT date_part('century',a.rep_start)::int as cohort_century
,count(distinct a.id_bioguide) as rep_and_sen
FROM
(
        SELECT id_bioguide, min(term_start) as rep_start
        FROM legislators_terms
        WHERE term_type = 'rep'
        GROUP BY 1
) a
JOIN legislators_terms b on a.id_bioguide = b.id_bioguide
and b.term_type = 'sen' and b.term_start > a.rep_start
GROUP BY 1
;

SELECT aa.cohort_century
,bb.rep_and_sen * 100.0 / aa.reps as pct_rep_and_sen
FROM
(
        SELECT date_part('century',a.rep_start)::int as cohort_century
        ,count(id_bioguide) as reps
        FROM
        (
                SELECT id_bioguide, min(term_start) as rep_start
                FROM legislators_terms
                WHERE term_type = 'rep'
                GROUP BY 1
        ) a
        GROUP BY 1
) aa
LEFT JOIN
(
        SELECT date_part('century',c.rep_start)::int as cohort_century
        ,count(distinct c.id_bioguide) as rep_and_sen
        FROM
        (
                SELECT id_bioguide, min(term_start) as rep_start
                FROM legislators_terms
                WHERE term_type = 'rep'
                GROUP BY 1
        ) c
        JOIN legislators_terms d on c.id_bioguide = d.id_bioguide
        and d.term_type = 'sen' and d.term_start > c.rep_start
        GROUP BY 1
) bb on aa.cohort_century = bb.cohort_century
;

SELECT aa.cohort_century
,bb.rep_and_sen * 100.0 / aa.reps as pct_10_yrs
FROM
(
        SELECT date_part('century',a.rep_start)::int as cohort_century
        ,count(id_bioguide) as reps
        FROM
        (
                SELECT id_bioguide, min(term_start) as rep_start
                FROM legislators_terms
                WHERE term_type = 'rep'
                GROUP BY 1
        ) a
        GROUP BY 1
) aa
LEFT JOIN
(
        SELECT date_part('century',b.rep_start)::int as cohort_century
        ,count(distinct b.id_bioguide) as rep_and_sen
        FROM
        (
                SELECT id_bioguide, min(term_start) as rep_start
                FROM legislators_terms
                WHERE term_type = 'rep'
                GROUP BY 1
        ) b
        JOIN legislators_terms c on b.id_bioguide = c.id_bioguide and c.term_type = 'sen' and c.term_start > b.rep_start
        WHERE age(c.term_start, b.rep_start) <= interval '10 years'
        GROUP BY 1
) bb on aa.cohort_century = bb.cohort_century
WHERE aa.cohort_century < 21
;

SELECT aa.cohort_century
,bb.rep_and_sen_5_yrs * 100.0 / aa.reps as pct_5_yrs
,bb.rep_and_sen_10_yrs * 100.0 / aa.reps as pct_10_yrs
,bb.rep_and_sen_15_yrs * 100.0 / aa.reps as pct_15_yrs
FROM
(
        SELECT date_part('century',a.rep_start)::int as cohort_century
        ,count(id_bioguide) as reps
        FROM
        (
                SELECT id_bioguide, min(term_start) as rep_start
                FROM legislators_terms
                WHERE term_type = 'rep'
                GROUP BY 1
        ) a
        GROUP BY 1
) aa
LEFT JOIN
(
        SELECT date_part('century',b.rep_start)::int as cohort_century
        ,count(distinct case when age(c.term_start, b.rep_start) <= interval '5 years' then b.id_bioguide end) as rep_and_sen_5_yrs
        ,count(distinct case when age(c.term_start, b.rep_start) <= interval '10 years' then b.id_bioguide end) as rep_and_sen_10_yrs
        ,count(distinct case when age(c.term_start, b.rep_start) <= interval '15 years' then b.id_bioguide end) as rep_and_sen_15_yrs
        FROM
        (
                SELECT id_bioguide, min(term_start) as rep_start
                FROM legislators_terms
                WHERE term_type = 'rep'
                GROUP BY 1
        ) b
        JOIN legislators_terms c on b.id_bioguide = c.id_bioguide and c.term_type = 'sen' and c.term_start > b.rep_start
        GROUP BY 1
) bb on aa.cohort_century = bb.cohort_century
WHERE aa.cohort_century < 21
;

----------- Cumulative calculations ----------------------------------
SELECT date_part('century',a.first_term)::int as century
,first_type
,count(distinct a.id_bioguide) as cohort
,count(b.term_start) as terms
FROM
(
        SELECT distinct id_bioguide
        ,first_value(term_type) over (partition by id_bioguide order by term_start) as first_type
        ,min(term_start) over (partition by id_bioguide) as first_term
        ,min(term_start) over (partition by id_bioguide) + interval '10 years' as first_plus_10
        FROM legislators_terms
) a
LEFT JOIN legislators_terms b on a.id_bioguide = b.id_bioguide and b.term_start between a.first_term and a.first_plus_10
GROUP BY 1,2
;

SELECT century
,max(case when first_type = 'rep' then cohort end) as rep_cohort
,max(case when first_type = 'rep' then terms_per_leg end) as avg_rep_terms
,max(case when first_type = 'sen' then cohort end) as sen_cohort
,max(case when first_type = 'sen' then terms_per_leg end) as avg_sen_terms
FROM
(
        SELECT date_part('century',a.first_term)::int as century
        ,first_type
        ,count(distinct a.id_bioguide) as cohort
        ,count(b.term_start) as terms
        ,count(b.term_start) * 1.0 / count(distinct a.id_bioguide) as terms_per_leg
        FROM
        (
                SELECT distinct id_bioguide
                ,first_value(term_type) over (partition by id_bioguide order by term_start) as first_type
                ,min(term_start) over (partition by id_bioguide) as first_term
                ,min(term_start) over (partition by id_bioguide) + interval '10 years' as first_plus_10
                FROM legislators_terms
        ) a
        LEFT JOIN legislators_terms b on a.id_bioguide = b.id_bioguide and b.term_start between a.first_term and a.first_plus_10
        GROUP BY 1,2
) aa
GROUP BY 1
;

----------- Cross-section analysis, with a cohort lens ----------------------------------
SELECT b.date, count(distinct a.id_bioguide) as legislators
FROM legislators_terms a
JOIN date_dim b on b.date between a.term_start and a.term_end
and b.month_name = 'December' 
and b.day_of_month = 31
and b.year <= 2019
GROUP BY 1
;

SELECT b.date
,date_part('century',first_term)::int as century
,count(distinct a.id_bioguide) as legislators
FROM legislators_terms a
JOIN date_dim b on b.date between a.term_start and a.term_end and b.month_name = 'December' and b.day_of_month = 31 and b.year <= 2019
JOIN
(
        SELECT id_bioguide, min(term_start) as first_term
        FROM legislators_terms
        GROUP BY 1
) c on a.id_bioguide = c.id_bioguide        
GROUP BY 1,2
;

SELECT date
,century
,legislators
,sum(legislators) over (partition by date) as cohort
,legislators * 100.0 / sum(legislators) over (partition by date) as pct_century
FROM
(
        SELECT b.date
        ,date_part('century',first_term)::int as century
        ,count(distinct a.id_bioguide) as legislators
        FROM legislators_terms a
        JOIN date_dim b on b.date between a.term_start and a.term_end and b.month_name = 'December' and b.day_of_month = 31 and b.year <= 2019
        JOIN
        (
                SELECT id_bioguide, min(term_start) as first_term
                FROM legislators_terms
                GROUP BY 1
        ) c on a.id_bioguide = c.id_bioguide        
        GROUP BY 1,2
) a
ORDER BY 1,2
;

SELECT date
,coalesce(sum(case when century = 18 then legislators end) * 100.0 / sum(legislators),0) as pct_18
,coalesce(sum(case when century = 19 then legislators end) * 100.0 / sum(legislators),0) as pct_19
,coalesce(sum(case when century = 20 then legislators end) * 100.0 / sum(legislators),0) as pct_20
,coalesce(sum(case when century = 21 then legislators end) * 100.0 / sum(legislators),0) as pct_21
FROM
(
        SELECT b.date
        ,date_part('century',first_term)::int as century
        ,count(distinct a.id_bioguide) as legislators
        FROM legislators_terms a
        JOIN date_dim b on b.date between a.term_start and a.term_end and b.month_name = 'December' and b.day_of_month = 31 and b.year <= 2019
        JOIN
        (
                SELECT id_bioguide, min(term_start) as first_term
                FROM legislators_terms
                GROUP BY 1
        ) c on a.id_bioguide = c.id_bioguide        
        GROUP BY 1,2
) aa
GROUP BY 1
ORDER BY 1
;

SELECT id_bioguide, date
,count(date) over (partition by id_bioguide order by date rows between unbounded preceding and current row) as cume_years
FROM
(
        SELECT distinct a.id_bioguide, b.date
        FROM legislators_terms a
        JOIN date_dim b on b.date between a.term_start and a.term_end and b.month_name = 'December' and b.day_of_month = 31 and b.year <= 2019
) a
;

SELECT date, cume_years
,count(distinct id_bioguide) as legislators
FROM
(
    SELECT id_bioguide, date
    ,count(date) over (partition by id_bioguide order by date rows between unbounded preceding and current row) as cume_years
    FROM
    (
        SELECT distinct a.id_bioguide, b.date
        FROM legislators_terms a
        JOIN date_dim b on b.date between a.term_start and a.term_end
        and b.month_name = 'December' and b.day_of_month = 31
        and b.year <= 2019
        GROUP BY 1,2
    ) aa
) aaa
GROUP BY 1,2
;

SELECT date, count(*) as tenures
FROM 
(
        SELECT date, cume_years
        ,count(distinct id_bioguide) as legislators
        FROM
        (
                SELECT id_bioguide, date
                ,count(date) over (partition by id_bioguide order by date rows between unbounded preceding and current row) as cume_years
                FROM
                (
                        SELECT distinct a.id_bioguide, b.date
                        FROM legislators_terms a
                        JOIN date_dim b on b.date between a.term_start and a.term_end and b.month_name = 'December' and b.day_of_month = 31 and b.year <= 2019
                        GROUP BY 1,2
                ) aa
        ) aaa
        GROUP BY 1,2
) aaaa
GROUP BY 1
;

SELECT date, tenure
,legislators * 100.0 /
 sum(legislators) over (partition by date) as pct_legislators 
FROM
(
        SELECT date
        ,case when cume_years <= 4 then '1 to 4'
              when cume_years <= 10 then '5 to 10'
              when cume_years <= 20 then '11 to 20'
              else '21+' end as tenure
        ,count(distinct id_bioguide) as legislators
        FROM
        (
                SELECT id_bioguide, date
                ,count(date) over (partition by id_bioguide order by date rows between unbounded preceding and current row) as cume_years
                FROM
                (
                        SELECT distinct a.id_bioguide, b.date
                        FROM legislators_terms a
                        JOIN date_dim b on b.date between a.term_start and a.term_end and b.month_name = 'December' and b.day_of_month = 31 and b.year <= 2019
                        GROUP BY 1,2
                ) a
        ) aa
        GROUP BY 1,2
) aaa
;











