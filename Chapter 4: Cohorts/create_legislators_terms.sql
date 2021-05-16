DROP table if exists legislators_terms;
CREATE table legislators_terms
(
id_bioguide varchar
,term_number int 
,term_id varchar primary key
,term_type varchar
,term_start date
,term_end date
,state varchar
,district int
,class int
,party varchar
,how varchar
,url varchar--terms_1_url
,address varchar --terms_1_address
,phone varchar --terms_1_phone
,fax varchar --terms_1_fax
,contact_form varchar --terms_1_contact_form
,office varchar--terms_1_office
,state_rank varchar --terms_1_state_rank
,rss_url varchar --terms_1_rss_url
,caucus varchar -- terms_1_caucus
)
;

COPY legislators_terms
FROM '/localpath/legislators_terms.csv' -- change to the location you saved the csv file
DELIMITER ','
CSV HEADER
;


