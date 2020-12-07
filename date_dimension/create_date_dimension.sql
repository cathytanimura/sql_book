DROP table if exists public.date_dim;

CREATE table public.date_dim
as
SELECT date::date
,to_char(date,'yyyymmdd')::int as date_key
,date_part('day',date)::int as day_of_month
,date_part('doy',date)::int as day_of_year
,date_part('dow',date)::int as day_of_week
,to_char(date, 'Day') as day_name
,to_char(date, 'Dy') as day_short_name
,date_part('week',date)::int as week_number
,to_char(date,'W')::int as week_of_month
,date_trunc('week',date)::date as week
,date_part('month',date)::int as month_number
,to_char(date, 'Month') as month_name
,to_char(date, 'Mon') as month_short_name
,date_trunc('month',date)::date as first_day_of_month
,(date_trunc('month',date) + interval '1 month' - interval '1 day')::date as last_day_of_month
,date_part('quarter',date)::int as quarter_number
,'Q' || date_part('quarter',date)::int as quarter_name
,date_trunc('quarter',date)::date as first_day_of_quarter
,(date_trunc('quarter',date) + interval '3 months' - interval '1 day')::date as last_day_of_quarter
,date_part('year',date)::int as year 
,date_part('decade',date)::int * 10 as decade
,date_part('century',date)::int as centurys
FROM generate_series('1770-01-01'::date, '2030-12-31'::date, '1 day') as date
;
