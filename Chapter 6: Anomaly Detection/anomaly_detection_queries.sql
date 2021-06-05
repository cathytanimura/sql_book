------ Detecting outliers
-- Sorting to find anomalies

SELECT mag
,count(id) as earthquakes
,round(count(id) * 100.0 / sum(count(id)) over (partition by 1),8) as pct_earthquakes
FROM earthquakes
WHERE mag is not null
GROUP BY 1
ORDER BY 1 desc
;

SELECT place, mag, count(*)
FROM earthquakes
WHERE mag is not null
and place = 'Northern California'
GROUP BY 1,2
ORDER BY 1,2 desc
;

-- Calculating percentiles to find anomalies

SELECT place
,mag
,percentile
,count(*)
FROM
(
    SELECT place
    ,mag
    ,percent_rank() over (partition by place order by mag) as percentile
    FROM earthquakes
    WHERE mag is not null
    and place = 'Northern California'
) a
GROUP BY 1,2,3
ORDER BY 1,2 desc
;

SELECT place, mag
,ntile(100) over (partition by place order by mag) as ntile
FROM earthquakes
WHERE mag is not null
and place = 'Central Alaska'
ORDER BY 1,2 desc
;

SELECT place, ntile
,max(mag) as maximum
,min(mag) as minimum
FROM
(
        SELECT place, mag
        ,ntile(4) over (partition by place order by mag) as ntile
        FROM earthquakes
        WHERE mag is not null
        and place = 'Central Alaska'
) a
GROUP BY 1,2
ORDER BY 1,2 desc
;

SELECT 
percentile_cont(0.25) within group (order by mag) as pct_25
,percentile_cont(0.5) within group (order by mag) as pct_50
,percentile_cont(0.75) within group (order by mag) as pct_75
FROM earthquakes
WHERE mag is not null
and place = 'Central Alaska'
;

SELECT 
percentile_cont(0.25) within group (order by mag) as pct_25_mag
,percentile_cont(0.25) within group (order by depth) as pct_25_depth
FROM earthquakes
WHERE mag is not null
and place = 'Central Alaska'
;

SELECT place
,percentile_cont(0.25) within group (order by mag) as pct_25_mag
,percentile_cont(0.25) within group (order by depth) as pct_25_depth
FROM earthquakes
WHERE mag is not null
and place in ('Central Alaska', 'Southern Alaska')
GROUP BY place
;

SELECT stddev_pop(mag) as stddev_pop_mag
,stddev_samp(mag) as stddev_samp_mag
FROM earthquakes
;

SELECT a.place
,a.mag
,b.avg_mag
,b.std_dev
,(a.mag - b.avg_mag) / b.std_dev as z_score
FROM earthquakes a
JOIN
(
    SELECT avg(mag) as avg_mag
    ,stddev_pop(mag) as std_dev
    FROM earthquakes
    WHERE mag is not null
) b on 1 = 1
WHERE a.mag is not null
ORDER BY 2 desc
;

-- Graphing to find anomalies visually

SELECT mag
,count(*) as earthquakes
FROM earthquakes
GROUP BY 1
ORDER BY 1
;

SELECT mag, depth
,count(*) as earthquakes
FROM earthquakes
GROUP BY 1,2
ORDER BY 1,2
;

SELECT mag
FROM earthquakes
WHERE place like '%Japan%'
ORDER BY 1
;

SELECT percentile_cont(0.25) within group (order by mag) as ntile_25
,percentile_cont(0.5) within group (order by mag) as median
,percentile_cont(0.75) within group (order by mag) as ntile_75
,1.5 * (percentile_cont(0.75) within group (order by mag) 
        - percentile_cont(0.25) within group (order by mag)
        ) as iqr 
,percentile_cont(0.25) within group (order by mag) 
   - (1.5 * (percentile_cont(0.75) within group (order by mag) 
             - percentile_cont(0.25) within group (order by mag)
             )
     ) as lower_whisker
,percentile_cont(0.75) within group (order by mag) 
   + (1.5 * (percentile_cont(0.75) within group (order by mag) 
             - percentile_cont(0.25) within group (order by mag)
             )
     ) as upper_whisker
FROM earthquakes
WHERE place like '%Japan%'
;

SELECT date_part('year',time)::int as year
,mag
FROM earthquakes
WHERE place like '%Japan%'
ORDER BY 1,2
;

------ Forms of anomalies
-- Anomalous values

SELECT mag, count(*)
FROM earthquakes
WHERE mag > 1
GROUP BY 1
ORDER BY 1
limit 100
;

SELECT net, count(*)
FROM earthquakes
WHERE depth > 600
GROUP BY 1
;

SELECT place, count(*)
FROM earthquakes
WHERE depth > 600
GROUP BY 1
;

SELECT 
case when place like '% of %' then split_part(place,' of ',2) 
     else place end as place_name
,count(*)
FROM earthquakes
WHERE depth > 600
GROUP BY 1
ORDER BY 2 desc
;

SELECT count(distinct type) as distinct_types
,count(distinct lower(type)) as distinct_lower
FROM earthquakes
;

SELECT type
,lower(type)
,type = lower(type) as flag
,count(*) as records
FROM earthquakes
GROUP BY 1,2,3
ORDER BY 2,4 desc
;




