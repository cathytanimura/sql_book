---- Text characteristics
SELECT length(sighting_report), count(*) as records
FROM ufo
GROUP BY 1
ORDER BY 1
;

---- Text parsing
SELECT left(sighting_report,8) as left_digits
,count(*)
FROM ufo
GROUP BY 1
;

SELECT right(left(sighting_report,25),14) as occurred
FROM ufo
;

SELECT split_part(sighting_report,'Occurred : ',2) as split_1
FROM ufo
;

SELECT split_part(sighting_report,' (Entered',1) as split_2
FROM ufo
;

SELECT split_part(
split_part(sighting_report,' (Entered',1)
,'Occurred : ',2) as occurred
FROM ufo
;

SELECT split_part(split_part(split_part(sighting_report,' (Entered',1),'Occurred : ',2),'Reported',1) as occurred
FROM ufo
;

SELECT split_part(split_part(split_part(sighting_report,' (Entered',1),'Occurred : ',2),'Reported',1) as occurred
,split_part(split_part(sighting_report,')',1),'Entered as : ',2) as entered_as
,split_part(split_part(split_part(split_part(sighting_report,'Post',1),'Reported: ',2),' AM',1),' PM',1) as reported
,split_part(split_part(sighting_report,'Location',1),'Posted: ',2) as posted
,split_part(split_part(sighting_report,'Shape',1),'Location: ',2) as location
,split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) as shape
,split_part(sighting_report,'Duration:',2) as duration
FROM ufo
;

---- Text transformations
SELECT distinct shape, initcap(shape) as shape_clean
FROM
(
        SELECT split_part(
        split_part(sighting_report,'Duration',1)
        ,'Shape: ',2) as shape
        FROM ufo
) a
;

SELECT duration, trim(duration) as duration_clean
FROM
(
    SELECT split_part(sighting_report,'Duration:',2) as duration
    FROM ufo
) a
;

SELECT occurred::timestamp
,reported::timestamp as reported
,posted::date as posted
FROM
(
        SELECT split_part(split_part(split_part(sighting_report,' (Entered',1),'Occurred : ',2),'Reported',1) as occurred   
        ,split_part(split_part(split_part(split_part(sighting_report,'Post',1),'Reported: ',2),' AM',1),' PM',1) as reported
        ,split_part(split_part(sighting_report,'Location',1),'Posted: ',2) as posted
        FROM ufo
        limit 10
) a
;

SELECT 
case when occurred = '' then null 
     when length(occurred) < 8 then null
     else occurred::timestamp 
     end as occurred
,case when length(reported) < 8 then null
      else reported::timestamp 
      end as reported
,case when posted = '' then null
      else posted::date  
      end as posted
FROM
(
        SELECT split_part(split_part(split_part(sighting_report,'(Entered',1),'Occurred : ',2),'Reported',1) as occurred 
        ,split_part(split_part(split_part(split_part(sighting_report,'Post',1),'Reported: ',2),' AM',1),' PM',1) as reported
        ,split_part(split_part(sighting_report,'Location',1),'Posted: ',2) as posted
        FROM ufo
) a
;

SELECT location
,replace(replace(location,'close to','near')
,'outside of','near') as location_clean
FROM
(
        SELECT split_part(split_part(sighting_report,'Shape',1),'Location: ',2) as location
        FROM ufo
) a
;

SELECT 
case when occurred = '' then null 
     when length(occurred) < 8 then null
     else occurred::timestamp 
     end as occurred
,entered_as
,case when length(reported) < 8 then null
      else reported::timestamp 
      end as reported
,case when posted = '' then null
      else posted::date  
      end as posted
,replace(replace(location,'close to','near'),'outside of','near') as location
,initcap(shape) as shape
,trim(duration) as duration
FROM
(
        SELECT split_part(split_part(split_part(sighting_report,' (Entered',1),'Occurred : ',2),'Reported',1) as occurred
        ,split_part(split_part(sighting_report,')',1),'Entered as : ',2) as entered_as   
        ,split_part(split_part(split_part(split_part(sighting_report,'Post',1),'Reported: ',2),' AM',1),' PM',1) as reported
        ,split_part(split_part(sighting_report,'Location',1),'Posted: ',2) as posted
        ,split_part(split_part(sighting_report,'Shape',1),'Location: ',2) as location
        ,split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) as shape
        ,split_part(sighting_report,'Duration:',2) as duration
        FROM ufo
) a
;

---- Finding elements within larger blocks of text
-- Wildcard matches
SELECT count(*)
FROM ufo
WHERE description like '%wife%'
;

SELECT count(*)
FROM ufo
WHERE lower(description) like '%wife%'
;

SELECT count(*)
FROM ufo
WHERE description ilike '%wife%'
;

SELECT count(*)
FROM ufo
WHERE lower(description) not like '%wife%'
;

SELECT count(*)
FROM ufo
WHERE lower(description) like '%wife%'
or lower(description) like '%husband%'
;

SELECT count(*)
FROM ufo
WHERE lower(description) like '%wife%'
or lower(description) like '%husband%'
and lower(description) like '%mother%'
;

SELECT count(*)
FROM ufo
WHERE (lower(description) like '%wife%'
       or lower(description) like '%husband%'
       )
and lower(description) like '%mother%'
;

SELECT 
case when lower(description) like '%driving%' then 'driving'
     when lower(description) like '%walking%' then 'walking'
     when lower(description) like '%running%' then 'running'
     when lower(description) like '%cycling%' then 'cycling'
     when lower(description) like '%swimming%' then 'swimming'
     else 'none' end as activity
,count(*)
FROM ufo
GROUP BY 1
ORDER BY 2 desc
;

SELECT description ilike '%south%' as south
,description ilike '%north%' as north
,description ilike '%east%' as east
,description ilike '%west%' as west
,count(*)
FROM ufo
GROUP BY 1,2,3,4
ORDER BY 1,2,3,4
;

SELECT 
count(case when description ilike '%south%' then 1 end) as south
,count(case when description ilike '%north%' then 1 end) as north
,count(case when description ilike '%west%' then 1 end) as west
,count(case when description ilike '%east%' then 1 end) as east
FROM ufo
;

-- Exact matches
SELECT first_word, description
FROM
(
    SELECT split_part(description,' ',1) as first_word
    ,description
    FROM ufo
) a
WHERE first_word = 'Red'
or first_word = 'Orange'
or first_word = 'Yellow'
or first_word = 'Green'
or first_word = 'Blue'
or first_word = 'Purple'
or first_word = 'White'
;

SELECT first_word, description
FROM
(
    SELECT split_part(description,' ',1) as first_word
    ,description
    FROM ufo
) a
WHERE first_word in ('Red','Orange','Yellow','Green','Blue','Purple','White')
;

SELECT 
case when lower(first_word) in ('red','orange','yellow','green', 
'blue','purple','white') then 'Color'
when lower(first_word) in ('round','circular','oval','cigar') 
then 'Shape'
when first_word ilike 'triang%' then 'Shape'
when first_word ilike 'flash%' then 'Motion'
when first_word ilike 'hover%' then 'Motion'
when first_word ilike 'pulsat%' then 'Motion'
else 'Other' 
end as first_word_type
,count(*)
FROM
(
    SELECT split_part(description,' ',1) as first_word
    ,description
    FROM ufo
) a
GROUP BY 1
ORDER BY 2 desc
;

-- Regular expressions
-- Finding and replacing with Regex
SELECT left(description,50)
FROM ufo
WHERE left(description,50) ~ '[0-9]+ light[s ,.]'
;

SELECT (regexp_matches(description,'[0-9]+ light[s ,.]'))[1]
,count(*)
FROM ufo
WHERE description ~ '[0-9]+ light[s ,.]'
GROUP BY 1
ORDER BY 2 desc
; 

SELECT min(split_part(matched_text,' ',1)::int) as min_lights
,max(split_part(matched_text,' ',1)::int) as max_lights
FROM
(
        SELECT (regexp_matches(description,'[0-9]+ light[s ,.]'))[1] as matched_text
        ,count(*)
        FROM ufo
        WHERE description ~ '[0-9]+ light[s ,.]'
        GROUP BY 1
) a
; 

SELECT split_part(sighting_report,'Duration:',2) as duration
,count(*) as reports
FROM ufo
GROUP BY 1
;

SELECT duration
,(regexp_matches(duration,'\m[Mm][Ii][Nn][A-Za-z]*\y'))[1] as matched_minutes
FROM
(
        SELECT split_part(sighting_report,'Duration:',2) as duration
        ,count(*) as reports
        FROM ufo
        GROUP BY 1
) a
;

SELECT duration
,(regexp_matches(duration,'\m[Mm][Ii][Nn][A-Za-z]*\y'))[1] as matched_minutes
,regexp_replace(duration,'\m[Mm][Ii][Nn][A-Za-z]*\y','min') as replaced_text
FROM
(
        SELECT split_part(sighting_report,'Duration:',2) as duration
        ,count(*) as reports
        FROM ufo
        GROUP BY 1
) a
;

SELECT duration
,(regexp_matches(duration,'\m[Hh][Oo][Uu][Rr][A-Za-z]*\y'))[1] as matched_hour
,(regexp_matches(duration,'\m[Mm][Ii][Nn][A-Za-z]*\y'))[1] as matched_minutes
,regexp_replace(regexp_replace(duration,'\m[Mm][Ii][Nn][A-Za-z]*\y','min'),'\m[Hh][Oo][Uu][Rr][A-Za-z]*\y','hr') as replaced_text
FROM
(
        SELECT split_part(sighting_report,'Duration:',2) as duration
        ,count(*) as reports
        FROM ufo
        GROUP BY 1
) a
;

----- Constructing and reshaping text
SELECT concat(shape, ' (shape)') as shape
,concat(reports, ' reports') as reports
FROM
(
        SELECT split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) as shape
        ,count(*) as reports
        FROM ufo
        GROUP BY 1
) a
;

SELECT concat(shape,' - ',location) as shape_location
,reports
FROM
(
        SELECT split_part(split_part(sighting_report,'Shape',1),'Location: ',2) as location
        ,split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) as shape
        ,count(*) as reports
        FROM ufo
        GROUP BY 1,2
) a
;

SELECT 
concat('There were '
       ,reports
       ,' reports of '
       ,lower(shape)
       ,' objects. The earliest sighting was '
       ,trim(to_char(earliest,'Month'))
       , ' '
       , date_part('day',earliest)
       , ', '
       , date_part('year',earliest)
       ,' and the most recent was '
       ,trim(to_char(latest,'Month'))
       , ' '
       , date_part('day',latest)
       , ', '
       , date_part('year',latest)
       ,'.'
       )
FROM
(
        SELECT shape
        ,min(occurred::date) as earliest
        ,max(occurred::date) as latest
        ,sum(reports) as reports
        FROM
        (
                SELECT split_part(split_part(split_part(sighting_report,' (Entered',1),'Occurred : ',2),'Reported',1) as occurred
                ,split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) as shape
                ,count(*) as reports
                FROM ufo
                GROUP BY 1,2
        ) a
        WHERE length(occurred) >= 8
        GROUP BY 1
) aa    
;

-- Reshaping
SELECT location
,string_agg(shape,', ' order by shape asc) as shapes
FROM
(
        SELECT 
        case when split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) = '' then 'Unknown'
             when split_part(split_part(sighting_report,'Duration',1),'Shape: ',2) = 'TRIANGULAR' then 'Triangle'
             else split_part(split_part(sighting_report,'Duration',1),'Shape: ',2)  
             end as shape
        ,split_part(split_part(sighting_report,'Shape',1),'Location: ',2) as location
        ,count(*) as reports
        FROM ufo
        GROUP BY 1,2
) a
GROUP BY 1
;

SELECT word, count(*) as frequency
FROM
(
        SELECT regexp_split_to_table(lower(description),'\s+') as word
        FROM ufo
) a
GROUP BY 1
ORDER BY 2 desc
;

SELECT word, count(*) as frequency
FROM
(
        SELECT regexp_split_to_table(lower(description),'\s+') as word
        FROM ufo
) a
LEFT JOIN stop_words b on a.word = b.stop_word
WHERE b.stop_word is null
GROUP BY 1
ORDER BY 2 desc
;










