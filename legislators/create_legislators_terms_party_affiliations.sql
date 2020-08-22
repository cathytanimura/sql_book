DROP table if exists legislators_terms_party_affiliations;

CREATE table legislators_terms_party_affiliations
(
affiliation_id varchar primary key
,id_bioguide varchar
,term int
,affilation_num int
,affiliation_start date
,affiliation_end date
,party varchar
)
;

-- 0,0
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 0 ||'-'|| 0
,id_bioguide
,0
,0
,terms_0_party_affiliations_0_start
,terms_0_party_affiliations_0_end
,terms_0_party_affiliations_0_party
FROM book_legislators_current
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 0 ||'-'|| 0
,id_bioguide
,0
,0
,terms_0_party_affiliations_0_start
,terms_0_party_affiliations_0_end
,terms_0_party_affiliations_0_party
FROM book_legislators_historical
;

--0,1
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 0 ||'-'|| 1
,id_bioguide
,0
,1
,terms_0_party_affiliations_1_start
,terms_0_party_affiliations_1_end
,terms_0_party_affiliations_1_party
FROM book_legislators_current
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 0 ||'-'|| 1
,id_bioguide
,0
,1
,terms_0_party_affiliations_1_start
,terms_0_party_affiliations_1_end
,terms_0_party_affiliations_1_party
FROM book_legislators_historical
;

----------------------------
-- 1,0
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 1 ||'-'|| 0
,id_bioguide
,1
,0
,terms_1_party_affiliations_0_start
,terms_1_party_affiliations_0_end
,terms_1_party_affiliations_0_party
FROM book_legislators_historical
;

--1,1
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 1 ||'-'|| 1
,id_bioguide
,1
,1
,terms_1_party_affiliations_1_start
,terms_1_party_affiliations_1_end
,terms_1_party_affiliations_1_party
FROM book_legislators_historical
;

----------------------------
-- 2,0
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 2 ||'-'|| 0
,id_bioguide
,2
,0
,terms_2_party_affiliations_0_start
,terms_2_party_affiliations_0_end
,terms_2_party_affiliations_0_party
FROM book_legislators_historical
;

--2,1
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 2 ||'-'|| 1
,id_bioguide
,2
,1
,terms_2_party_affiliations_1_start
,terms_2_party_affiliations_1_end
,terms_2_party_affiliations_1_party
FROM book_legislators_historical
;

----------------------------
-- 3,0
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 3 ||'-'|| 0
,id_bioguide
,3
,0
,terms_3_party_affiliations_0_start
,terms_3_party_affiliations_0_end
,terms_3_party_affiliations_0_party
FROM book_legislators_historical
;

--3,1
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 3 ||'-'|| 1
,id_bioguide
,3
,1
,terms_3_party_affiliations_1_start
,terms_3_party_affiliations_1_end
,terms_3_party_affiliations_1_party
FROM book_legislators_historical
;

----------------------------
-- 4,0

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 0
,id_bioguide
,4
,0
,terms_4_party_affiliations_0_start
,terms_4_party_affiliations_0_end
,terms_4_party_affiliations_0_party
FROM book_legislators_current
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 0
,id_bioguide
,4
,0
,terms_4_party_affiliations_0_start
,terms_4_party_affiliations_0_end
,terms_4_party_affiliations_0_party
FROM book_legislators_historical
;

--4,1

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 1
,id_bioguide
,4
,1
,terms_4_party_affiliations_1_start
,terms_4_party_affiliations_1_end
,terms_4_party_affiliations_1_party
FROM book_legislators_current
;


INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 1
,id_bioguide
,4
,1
,terms_4_party_affiliations_1_start
,terms_4_party_affiliations_1_end
,terms_4_party_affiliations_1_party
FROM book_legislators_historical
;

--4,2

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 2
,id_bioguide
,4
,2
,terms_4_party_affiliations_2_start
,terms_4_party_affiliations_2_end
,terms_4_party_affiliations_2_party
FROM book_legislators_current
;

----------------------------
-- 5,0

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 5 ||'-'|| 0
,id_bioguide
,5
,0
,terms_5_party_affiliations_0_start
,terms_5_party_affiliations_0_end
,terms_5_party_affiliations_0_party
FROM book_legislators_current
;

--5,1

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 5 ||'-'|| 1
,id_bioguide
,5
,1
,terms_5_party_affiliations_1_start
,terms_5_party_affiliations_1_end
,terms_5_party_affiliations_1_party
FROM book_legislators_current
;

-- 8

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 8 ||'-'|| 0
,id_bioguide
,8
,0
,terms_8_party_affiliations_0_start
,terms_8_party_affiliations_0_end
,terms_8_party_affiliations_0_party
FROM book_legislators_historical
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 8 ||'-'|| 1
,id_bioguide
,8
,1
,terms_8_party_affiliations_1_start
,terms_8_party_affiliations_1_end
,terms_8_party_affiliations_1_party
FROM book_legislators_historical
;

-- 9
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 9 ||'-'|| 0
,id_bioguide
,9
,0
,terms_9_party_affiliations_0_start
,terms_9_party_affiliations_0_end
,terms_9_party_affiliations_0_party
FROM book_legislators_historical
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 9 ||'-'|| 1
,id_bioguide
,9
,1
,terms_9_party_affiliations_1_start
,terms_9_party_affiliations_1_end
,terms_9_party_affiliations_1_party
FROM book_legislators_historical
;


-- 11
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 11 ||'-'|| 0
,id_bioguide
,11
,0
,terms_11_party_affiliations_0_start
,terms_11_party_affiliations_0_end
,terms_11_party_affiliations_0_party
FROM book_legislators_historical
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 11 ||'-'|| 1
,id_bioguide
,11
,1
,terms_11_party_affiliations_1_start
,terms_11_party_affiliations_1_end
,terms_11_party_affiliations_1_party
FROM book_legislators_historical
;

-- 12
INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 12 ||'-'|| 0
,id_bioguide
,12
,0
,terms_12_party_affiliations_0_start
,terms_12_party_affiliations_0_end
,terms_12_party_affiliations_0_party
FROM book_legislators_historical
;

INSERT into legislators_terms_party_affiliations
(
affiliation_id
,id_bioguide
,term
,affilation_num
,affiliation_start
,affiliation_end
,party
)
SELECT
id_bioguide ||'-'|| 12 ||'-'|| 1
,id_bioguide
,12
,1
,terms_12_party_affiliations_1_start
,terms_12_party_affiliations_1_end
,terms_12_party_affiliations_1_party
FROM book_legislators_historical
;

