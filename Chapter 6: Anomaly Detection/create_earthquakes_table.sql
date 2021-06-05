DROP table if exists public.earthquakes;
CREATE table public.earthquakes
(
time timestamp
,latitude decimal
,longitude decimal
,depth decimal
,mag decimal
,magType varchar
,nst decimal
,gap decimal
,dmin decimal
,rms decimal
,net varchar
,id varchar
,updated timestamp
,place varchar
,type varchar
,horizontalError decimal
,depthError decimal
,magError decimal
,magNst decimal
,status varchar
,locationSource varchar
,magSource varchar
)
;

-- replace localpath with the directory where you saved the csv files. The data set is large - the code will run if you load one or a few files, but the results will differ.

COPY public.earthquakes FROM '/localpath/earthquakes1.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes2.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes3.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes4.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes5.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes6.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes7.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes8.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes9.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes10.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes11.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes12.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes13.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes14.csv' DELIMITER ',' CSV HEADER;

COPY public.earthquakes FROM '/localpath/earthquakes15.csv' DELIMITER ',' CSV HEADER;
