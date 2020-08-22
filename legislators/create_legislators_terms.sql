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

-- term 0
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,0 as term_number
,id_bioguide ||'-'|| 0 as term_id 
,terms_0_type
,terms_0_start
,terms_0_end
,terms_0_state
,terms_0_district
,terms_0_class
,terms_0_party
,terms_0_how
,terms_0_url
,terms_0_address
,terms_0_phone
,terms_0_fax
,terms_0_contact_form
,terms_0_office
,terms_0_state_rank
,terms_0_rss_url
,terms_0_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,0 as term_number
,id_bioguide ||'-'|| 0 as term_id 
,terms_0_type
,terms_0_start
,terms_0_end
,terms_0_state
,terms_0_district
,terms_0_class
,terms_0_party
,terms_0_how
,terms_0_url
,terms_0_address
,terms_0_phone
,terms_0_fax
,terms_0_contact_form
,terms_0_office
,terms_0_state_rank
,terms_0_rss_url
FROM book_legislators_historical
;

-- term 1
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,1 as term_number
,id_bioguide ||'-'|| 1 as term_id 
,terms_1_type
,terms_1_start
,terms_1_end
,terms_1_state
,terms_1_district
,terms_1_class
,terms_1_party
,terms_1_how
,terms_1_url
,terms_1_address
,terms_1_phone
,terms_1_fax
,terms_1_contact_form
,terms_1_office
,terms_1_state_rank
,terms_1_rss_url
,terms_1_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,1 as term_number
,id_bioguide ||'-'|| 1 as term_id 
,terms_1_type
,terms_1_start
,terms_1_end
,terms_1_state
,terms_1_district
,terms_1_class
,terms_1_party
,terms_1_how
,terms_1_url
,terms_1_address
,terms_1_phone
,terms_1_fax
,terms_1_contact_form
,terms_1_office
,terms_1_state_rank
,terms_1_rss_url
FROM book_legislators_historical
;

-- term 2
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,2 as term_number
,id_bioguide ||'-'|| 2 as term_id 
,terms_2_type
,terms_2_start
,terms_2_end
,terms_2_state
,terms_2_district
,terms_2_class
,terms_2_party
,terms_2_how
,terms_2_url
,terms_2_address
,terms_2_phone
,terms_2_fax
,terms_2_contact_form
,terms_2_office
,terms_2_state_rank
,terms_2_rss_url
,terms_2_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,2 as term_number
,id_bioguide ||'-'|| 2 as term_id 
,terms_2_type
,terms_2_start
,terms_2_end
,terms_2_state
,terms_2_district
,terms_2_class
,terms_2_party
,terms_2_how
,terms_2_url
,terms_2_address
,terms_2_phone
,terms_2_fax
,terms_2_contact_form
,terms_2_office
,terms_2_state_rank
,terms_2_rss_url
FROM book_legislators_historical
;


-- term 3
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,3 as term_number
,id_bioguide ||'-'|| 3 as term_id 
,terms_3_type
,terms_3_start
,terms_3_end
,terms_3_state
,terms_3_district
,terms_3_class
,terms_3_party
--,terms_3_how
,terms_3_url
,terms_3_address
,terms_3_phone
,terms_3_fax
,terms_3_contact_form
,terms_3_office
,terms_3_state_rank
,terms_3_rss_url
,terms_3_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,3 as term_number
,id_bioguide ||'-'|| 3 as term_id 
,terms_3_type
,terms_3_start
,terms_3_end
,terms_3_state
,terms_3_district
,terms_3_class
,terms_3_party
,terms_3_how
,terms_3_url
,terms_3_address
,terms_3_phone
,terms_3_fax
,terms_3_contact_form
,terms_3_office
,terms_3_state_rank
,terms_3_rss_url
FROM book_legislators_historical
;


-- term 4
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,4 as term_number
,id_bioguide ||'-'|| 4 as term_id 
,terms_4_type
,terms_4_start
,terms_4_end
,terms_4_state
,terms_4_district
,terms_4_class
,terms_4_party
--,terms_4_how
,terms_4_url
,terms_4_address
,terms_4_phone
,terms_4_fax
,terms_4_contact_form
,terms_4_office
,terms_4_state_rank
,terms_4_rss_url
,terms_4_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,4 as term_number
,id_bioguide ||'-'|| 4 as term_id 
,terms_4_type
,terms_4_start
,terms_4_end
,terms_4_state
,terms_4_district
,terms_4_class
,terms_4_party
,terms_4_how
,terms_4_url
,terms_4_address
,terms_4_phone
,terms_4_fax
,terms_4_contact_form
,terms_4_office
,terms_4_state_rank
,terms_4_rss_url
FROM book_legislators_historical
;


-- term 5
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,5 as term_number
,id_bioguide ||'-'|| 5 as term_id 
,terms_5_type
,terms_5_start
,terms_5_end
,terms_5_state
,terms_5_district
,terms_5_class
,terms_5_party
--,terms_5_how
,terms_5_url
,terms_5_address
,terms_5_phone
,terms_5_fax
,terms_5_contact_form
,terms_5_office
,terms_5_state_rank
,terms_5_rss_url
,terms_5_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,5 as term_number
,id_bioguide ||'-'|| 5 as term_id 
,terms_5_type
,terms_5_start
,terms_5_end
,terms_5_state
,terms_5_district
,terms_5_class
,terms_5_party
,terms_5_how
,terms_5_url
,terms_5_address
,terms_5_phone
,terms_5_fax
,terms_5_contact_form
,terms_5_office
,terms_5_state_rank
,terms_5_rss_url
FROM book_legislators_historical
;


-- term 6
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,6 as term_number
,id_bioguide ||'-'|| 6 as term_id 
,terms_6_type
,terms_6_start
,terms_6_end
,terms_6_state
,terms_6_district
,terms_6_class
,terms_6_party
--,terms_6_how
,terms_6_url
,terms_6_address
,terms_6_phone
,terms_6_fax
,terms_6_contact_form
,terms_6_office
,terms_6_state_rank
,terms_6_rss_url
,terms_6_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,6 as term_number
,id_bioguide ||'-'|| 6 as term_id 
,terms_6_type
,terms_6_start
,terms_6_end
,terms_6_state
,terms_6_district
,terms_6_class
,terms_6_party
,terms_6_how
,terms_6_url
,terms_6_address
,terms_6_phone
,terms_6_fax
,terms_6_contact_form
,terms_6_office
,terms_6_state_rank
,terms_6_rss_url
FROM book_legislators_historical
;


-- term 7
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,7 as term_number
,id_bioguide ||'-'|| 7 as term_id 
,terms_7_type
,terms_7_start
,terms_7_end
,terms_7_state
,terms_7_district
,terms_7_class
,terms_7_party
,terms_7_how
,terms_7_url
,terms_7_address
,terms_7_phone
,terms_7_fax
,terms_7_contact_form
,terms_7_office
,terms_7_state_rank
,terms_7_rss_url
,terms_7_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,7 as term_number
,id_bioguide ||'-'|| 7 as term_id 
,terms_7_type
,terms_7_start
,terms_7_end
,terms_7_state
,terms_7_district
,terms_7_class
,terms_7_party
,terms_7_how
,terms_7_url
,terms_7_address
,terms_7_phone
,terms_7_fax
,terms_7_contact_form
,terms_7_office
,terms_7_state_rank
,terms_7_rss_url
FROM book_legislators_historical
;




-- term 8
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,8 as term_number
,id_bioguide ||'-'|| 8 as term_id 
,terms_8_type
,terms_8_start
,terms_8_end
,terms_8_state
,terms_8_district
,terms_8_class
,terms_8_party
--,terms_8_how
,terms_8_url
,terms_8_address
,terms_8_phone
,terms_8_fax
,terms_8_contact_form
,terms_8_office
,terms_8_state_rank
,terms_8_rss_url
,terms_8_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,8 as term_number
,id_bioguide ||'-'|| 8 as term_id 
,terms_8_type
,terms_8_start
,terms_8_end
,terms_8_state
,terms_8_district
,terms_8_class
,terms_8_party
,terms_8_how
,terms_8_url
,terms_8_address
,terms_8_phone
,terms_8_fax
,terms_8_contact_form
,terms_8_office
,terms_8_state_rank
,terms_8_rss_url
FROM book_legislators_historical
;




-- term 9
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,9 as term_number
,id_bioguide ||'-'|| 9 as term_id 
,terms_9_type
,terms_9_start
,terms_9_end
,terms_9_state
,terms_9_district
,terms_9_class
,terms_9_party
--,terms_9_how
,terms_9_url
,terms_9_address
,terms_9_phone
,terms_9_fax
,terms_9_contact_form
,terms_9_office
,terms_9_state_rank
,terms_9_rss_url
,terms_9_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
)
SELECT 
id_bioguide
,9 as term_number
,id_bioguide ||'-'|| 9 as term_id 
,terms_9_type
,terms_9_start
,terms_9_end
,terms_9_state
,terms_9_district
,terms_9_class
,terms_9_party
,terms_9_how
,terms_9_url
,terms_9_address
,terms_9_phone
,terms_9_fax
,terms_9_contact_form
,terms_9_office
,terms_9_state_rank
,terms_9_rss_url
FROM book_legislators_historical
;

-- term 10
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
,caucus
)
SELECT 
id_bioguide
,10 as term_number
,id_bioguide ||'-'|| 10 as term_id 
,terms_10_type
,terms_10_start
,terms_10_end
,terms_10_state
,terms_10_district
,terms_10_class
,terms_10_party
--,terms_10_how
,terms_10_url
,terms_10_address
,terms_10_phone
,terms_10_fax
,terms_10_contact_form
,terms_10_office
,terms_10_state_rank
,terms_10_rss_url
,terms_10_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,10 as term_number
,id_bioguide ||'-'|| 10 as term_id 
,terms_10_type
,terms_10_start
,terms_10_end
,terms_10_state
,terms_10_district
,terms_10_class
,terms_10_party
--,terms_10_how
,terms_10_url
,terms_10_address
,terms_10_phone
,terms_10_fax
,terms_10_contact_form
,terms_10_office
--,terms_10_state_rank
,terms_10_rss_url
FROM book_legislators_historical
;


-- term 11
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,11 as term_number
,id_bioguide ||'-'|| 11 as term_id 
,terms_11_type
,terms_11_start
,terms_11_end
,terms_11_state
,terms_11_district
,terms_11_class
,terms_11_party
--,terms_11_how
,terms_11_url
,terms_11_address
,terms_11_phone
,terms_11_fax
,terms_11_contact_form
,terms_11_office
,terms_11_state_rank
,terms_11_rss_url
--,terms_11_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,11 as term_number
,id_bioguide ||'-'|| 11 as term_id 
,terms_11_type
,terms_11_start
,terms_11_end
,terms_11_state
,terms_11_district
,terms_11_class
,terms_11_party
--,terms_11_how
,terms_11_url
,terms_11_address
,terms_11_phone
,terms_11_fax
,terms_11_contact_form
,terms_11_office
--,terms_11_state_rank
,terms_11_rss_url
FROM book_legislators_historical
;

-- term 12
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,12 as term_number
,id_bioguide ||'-'|| 12 as term_id 
,terms_12_type
,terms_12_start
,terms_12_end
,terms_12_state
,terms_12_district
,terms_12_class
,terms_12_party
--,terms_12_how
,terms_12_url
,terms_12_address
,terms_12_phone
,terms_12_fax
,terms_12_contact_form
,terms_12_office
,terms_12_state_rank
,terms_12_rss_url
--,terms_12_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,12 as term_number
,id_bioguide ||'-'|| 12 as term_id 
,terms_12_type
,terms_12_start
,terms_12_end
,terms_12_state
,terms_12_district
,terms_12_class
,terms_12_party
,terms_12_how
,terms_12_url
,terms_12_address
,terms_12_phone
,terms_12_fax
,terms_12_contact_form
,terms_12_office
--,terms_12_state_rank
,terms_12_rss_url
FROM book_legislators_historical
;

-- term 13
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,13 as term_number
,id_bioguide ||'-'|| 13 as term_id 
,terms_13_type
,terms_13_start
,terms_13_end
,terms_13_state
,terms_13_district
--,terms_13_class
,terms_13_party
--,terms_13_how
,terms_13_url
,terms_13_address
,terms_13_phone
,terms_13_fax
,terms_13_contact_form
,terms_13_office
--,terms_13_state_rank
,terms_13_rss_url
--,terms_13_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,13 as term_number
,id_bioguide ||'-'|| 13 as term_id 
,terms_13_type
,terms_13_start
,terms_13_end
,terms_13_state
,terms_13_district
,terms_13_class
,terms_13_party
--,terms_13_how
,terms_13_url
,terms_13_address
,terms_13_phone
,terms_13_fax
,terms_13_contact_form
,terms_13_office
--,terms_13_state_rank
,terms_13_rss_url
FROM book_legislators_historical
;


--- term 14 
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,14 as term_number
,id_bioguide ||'-'|| 14 as term_id 
,terms_14_type
,terms_14_start
,terms_14_end
,terms_14_state
,terms_14_district
--,terms_14_class
,terms_14_party
--,terms_14_how
,terms_14_url
,terms_14_address
,terms_14_phone
,terms_14_fax
,terms_14_contact_form
,terms_14_office
--,terms_14_state_rank
,terms_14_rss_url
--,terms_14_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,14 as term_number
,id_bioguide ||'-'|| 14 as term_id 
,terms_14_type
,terms_14_start
,terms_14_end
,terms_14_state
,terms_14_district
,terms_14_class
,terms_14_party
--,terms_14_how
,terms_14_url
,terms_14_address
,terms_14_phone
,terms_14_fax
,terms_14_contact_form
,terms_14_office
--,terms_14_state_rank
,terms_14_rss_url
FROM book_legislators_historical
;

-- term 15
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,15 as term_number
,id_bioguide ||'-'|| 15 as term_id 
,terms_15_type
,terms_15_start
,terms_15_end
,terms_15_state
,terms_15_district
--,terms_15_class
,terms_15_party
--,terms_15_how
,terms_15_url
,terms_15_address
,terms_15_phone
,terms_15_fax
,terms_15_contact_form
,terms_15_office
--,terms_15_state_rank
,terms_15_rss_url
--,terms_15_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,15 as term_number
,id_bioguide ||'-'|| 15 as term_id 
,terms_15_type
,terms_15_start
,terms_15_end
,terms_15_state
,terms_15_district
,terms_15_class
,terms_15_party
--,terms_15_how
,terms_15_url
,terms_15_address
,terms_15_phone
,terms_15_fax
,terms_15_contact_form
,terms_15_office
--,terms_15_state_rank
,terms_15_rss_url
FROM book_legislators_historical
;


-- term 16
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,16 as term_number
,id_bioguide ||'-'|| 16 as term_id 
,terms_16_type
,terms_16_start
,terms_16_end
,terms_16_state
,terms_16_district
--,terms_16_class
,terms_16_party
--,terms_16_how
,terms_16_url
,terms_16_address
,terms_16_phone
,terms_16_fax
,terms_16_contact_form
,terms_16_office
--,terms_16_state_rank
,terms_16_rss_url
--,terms_16_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,16 as term_number
,id_bioguide ||'-'|| 16 as term_id 
,terms_16_type
,terms_16_start
,terms_16_end
,terms_16_state
,terms_16_district
,terms_16_class
,terms_16_party
--,terms_16_how
,terms_16_url
,terms_16_address
,terms_16_phone
,terms_16_fax
,terms_16_contact_form
,terms_16_office
--,terms_16_state_rank
,terms_16_rss_url
FROM book_legislators_historical
;


-- term 17
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,17 as term_number
,id_bioguide ||'-'|| 17 as term_id 
,terms_17_type
,terms_17_start
,terms_17_end
,terms_17_state
,terms_17_district
--,terms_17_class
,terms_17_party
--,terms_17_how
,terms_17_url
,terms_17_address
,terms_17_phone
,terms_17_fax
,terms_17_contact_form
,terms_17_office
--,terms_17_state_rank
,terms_17_rss_url
--,terms_17_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,17 as term_number
,id_bioguide ||'-'|| 17 as term_id 
,terms_17_type
,terms_17_start
,terms_17_end
,terms_17_state
,terms_17_district
--,terms_17_class
,terms_17_party
--,terms_17_how
,terms_17_url
,terms_17_address
,terms_17_phone
,terms_17_fax
,terms_17_contact_form
,terms_17_office
--,terms_17_state_rank
,terms_17_rss_url
FROM book_legislators_historical
;

-- term 18
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,18 as term_number
,id_bioguide ||'-'|| 18 as term_id 
,terms_18_type
,terms_18_start
,terms_18_end
,terms_18_state
,terms_18_district
--,terms_18_class
,terms_18_party
--,terms_18_how
,terms_18_url
,terms_18_address
,terms_18_phone
,terms_18_fax
,terms_18_contact_form
,terms_18_office
--,terms_18_state_rank
,terms_18_rss_url
--,terms_18_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,18 as term_number
,id_bioguide ||'-'|| 18 as term_id 
,terms_18_type
,terms_18_start
,terms_18_end
,terms_18_state
,terms_18_district
--,terms_18_class
,terms_18_party
--,terms_18_how
,terms_18_url
,terms_18_address
,terms_18_phone
,terms_18_fax
,terms_18_contact_form
,terms_18_office
--,terms_18_state_rank
,terms_18_rss_url
FROM book_legislators_historical
;


-- term 19
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,19 as term_number
,id_bioguide ||'-'|| 19 as term_id 
,terms_19_type
,terms_19_start
,terms_19_end
,terms_19_state
,terms_19_district
--,terms_19_class
,terms_19_party
--,terms_19_how
,terms_19_url
,terms_19_address
,terms_19_phone
,terms_19_fax
,terms_19_contact_form
,terms_19_office
--,terms_19_state_rank
,terms_19_rss_url
--,terms_19_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,19 as term_number
,id_bioguide ||'-'|| 19 as term_id 
,terms_19_type
,terms_19_start
,terms_19_end
,terms_19_state
,terms_19_district
--,terms_19_class
,terms_19_party
--,terms_19_how
,terms_19_url
,terms_19_address
,terms_19_phone
,terms_19_fax
,terms_19_contact_form
,terms_19_office
--,terms_19_state_rank
,terms_19_rss_url
FROM book_legislators_historical
;


-- term 20
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,20 as term_number
,id_bioguide ||'-'|| 20 as term_id 
,terms_20_type
,terms_20_start
,terms_20_end
,terms_20_state
,terms_20_district
,terms_20_class
,terms_20_party
--,terms_20_how
,terms_20_url
,terms_20_address
,terms_20_phone
,terms_20_fax
,terms_20_contact_form
,terms_20_office
,terms_20_state_rank
,terms_20_rss_url
--,terms_20_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
--,rss_url
)
SELECT 
id_bioguide
,20 as term_number
,id_bioguide ||'-'|| 20 as term_id 
,terms_20_type
,terms_20_start
,terms_20_end
,terms_20_state
,terms_20_district
--,terms_20_class
,terms_20_party
--,terms_20_how
,terms_20_url
,terms_20_address
,terms_20_phone
,terms_20_fax
,terms_20_contact_form
,terms_20_office
--,terms_20_state_rank
--,terms_20_rss_url
FROM book_legislators_historical
;


-- term 21
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,21 as term_number
,id_bioguide ||'-'|| 21 as term_id 
,terms_21_type
,terms_21_start
,terms_21_end
,terms_21_state
,terms_21_district
,terms_21_class
,terms_21_party
--,terms_21_how
,terms_21_url
,terms_21_address
,terms_21_phone
,terms_21_fax
,terms_21_contact_form
,terms_21_office
,terms_21_state_rank
,terms_21_rss_url
--,terms_21_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,21 as term_number
,id_bioguide ||'-'|| 21 as term_id 
,terms_21_type
,terms_21_start
,terms_21_end
,terms_21_state
,terms_21_district
--,terms_21_class
,terms_21_party
--,terms_21_how
,terms_21_url
,terms_21_address
,terms_21_phone
,terms_21_fax
,terms_21_contact_form
,terms_21_office
--,terms_21_state_rank
,terms_21_rss_url
FROM book_legislators_historical
;

-- term 22
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
--,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,22 as term_number
,id_bioguide ||'-'|| 22 as term_id 
,terms_22_type
,terms_22_start
,terms_22_end
,terms_22_state
,terms_22_district
--,terms_22_class
,terms_22_party
--,terms_22_how
,terms_22_url
,terms_22_address
,terms_22_phone
,terms_22_fax
--,terms_22_contact_form
,terms_22_office
--,terms_22_state_rank
,terms_22_rss_url
--,terms_22_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,22 as term_number
,id_bioguide ||'-'|| 22 as term_id 
,terms_22_type
,terms_22_start
,terms_22_end
,terms_22_state
,terms_22_district
--,terms_22_class
,terms_22_party
--,terms_22_how
,terms_22_url
,terms_22_address
,terms_22_phone
,terms_22_fax
,terms_22_contact_form
,terms_22_office
--,terms_22_state_rank
,terms_22_rss_url
FROM book_legislators_historical
;


-- term 23
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end
,state
,district
--,class
,party
--,how
,url
,address
,phone
--,fax
--,contact_form
,office
--,state_rank
,rss_url
--,caucus
)
SELECT 
id_bioguide
,23 as term_number
,id_bioguide ||'-'|| 23 as term_id 
,terms_23_type
,terms_23_start
,terms_23_end
,terms_23_state
,terms_23_district
--,terms_23_class
,terms_23_party
--,terms_23_how
,terms_23_url
,terms_23_address
,terms_23_phone
--,terms_23_fax
--,terms_23_contact_form
,terms_23_office
--,terms_23_state_rank
,terms_23_rss_url
--,terms_23_caucus
FROM book_legislators_current
;

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
--,rss_url
)
SELECT 
id_bioguide
,23 as term_number
,id_bioguide ||'-'|| 23 as term_id 
,terms_23_type
,terms_23_start
,terms_23_end
,terms_23_state
,terms_23_district
--,terms_23_class
,terms_23_party
--,terms_23_how
,terms_23_url
,terms_23_address
,terms_23_phone
,terms_23_fax
,terms_23_contact_form
,terms_23_office
--,terms_23_state_rank
--,terms_23_rss_url
FROM book_legislators_historical
;


-- term 24 (only historical)

INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,24 as term_number
,id_bioguide ||'-'|| 24 as term_id 
,terms_24_type
,terms_24_start
,terms_24_end
,terms_24_state
,terms_24_district
--,terms_24_class
,terms_24_party
--,terms_24_how
,terms_24_url
,terms_24_address
,terms_24_phone
,terms_24_fax
,terms_24_contact_form
,terms_24_office
--,terms_24_state_rank
,terms_24_rss_url
FROM book_legislators_historical
;

-- term 25
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,25 as term_number
,id_bioguide ||'-'|| 25 as term_id 
,terms_25_type
,terms_25_start
,terms_25_end
,terms_25_state
,terms_25_district
--,terms_25_class
,terms_25_party
--,terms_25_how
,terms_25_url
,terms_25_address
,terms_25_phone
,terms_25_fax
,terms_25_contact_form
,terms_25_office
--,terms_25_state_rank
,terms_25_rss_url
FROM book_legislators_historical
;

-- term 26
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
--,contact_form
,office
--,state_rank
,rss_url
)
SELECT 
id_bioguide
,26 as term_number
,id_bioguide ||'-'|| 26 as term_id 
,terms_26_type
,terms_26_start
,terms_26_end
,terms_26_state
,terms_26_district
--,terms_26_class
,terms_26_party
--,terms_26_how
,terms_26_url
,terms_26_address
,terms_26_phone
,terms_26_fax
--,terms_26_contact_form
,terms_26_office
--,terms_26_state_rank
,terms_26_rss_url
FROM book_legislators_historical
;

-- term 27
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
--,address
--,phone
--,fax
--,contact_form
--,office
--,state_rank
--,rss_url
)
SELECT 
id_bioguide
,27 as term_number
,id_bioguide ||'-'|| 27 as term_id 
,terms_27_type
,terms_27_start
,terms_27_end
,terms_27_state
,terms_27_district
--,terms_27_class
,terms_27_party
--,terms_27_how
,terms_27_url
--,terms_27_address
--,terms_27_phone
--,terms_27_fax
--,terms_27_contact_form
--,terms_27_office
--,terms_27_state_rank
--,terms_27_rss_url
FROM book_legislators_historical
;

-- term 28
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
--,rss_url
)
SELECT 
id_bioguide
,28 as term_number
,id_bioguide ||'-'|| 28 as term_id 
,terms_28_type
,terms_28_start
,terms_28_end
,terms_28_state
,terms_28_district
--,terms_28_class
,terms_28_party
--,terms_28_how
,terms_28_url
,terms_28_address
,terms_28_phone
,terms_28_fax
,terms_28_contact_form
,terms_28_office
--,terms_28_state_rank
--,terms_28_rss_url
FROM book_legislators_historical
;

-- term 29
INSERT into legislators_terms
(
id_bioguide
,term_number
,term_id
,term_type
,term_start
,term_end 
,state
,district
--,class
,party
--,how
,url
,address
,phone
,fax
,contact_form
,office
--,state_rank
--,rss_url
)
SELECT 
id_bioguide
,29 as term_number
,id_bioguide ||'-'|| 29 as term_id 
,terms_29_type
,terms_29_start
,terms_29_end
,terms_29_state
,terms_29_district
--,terms_29_class
,terms_29_party
--,terms_29_how
,terms_29_url
,terms_29_address
,terms_29_phone
,terms_29_fax
,terms_29_contact_form
,terms_29_office
--,terms_29_state_rank
--,terms_29_rss_url
FROM book_legislators_historical
;

