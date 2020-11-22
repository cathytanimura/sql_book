DROP table if exists legislators_leadership_roles;
CREATE table legislators_leadership_roles
(
leadership_roles_id varchar primary key
,id_bioguide varchar
,term int
,title varchar
,chamber varchar
,start_date date
,end_date date
)
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 0 ||'-'|| 'leadership' 
,id_bioguide
,0
,leadership_roles_0_title
,leadership_roles_0_chamber
,leadership_roles_0_start
,leadership_roles_0_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 0 ||'-'|| 'leadership' 
,id_bioguide
,0
,leadership_roles_0_title
,leadership_roles_0_chamber
,leadership_roles_0_start
,leadership_roles_0_end
FROM book_legislators_historical
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 1 ||'-'|| 'leadership' 
,id_bioguide
,1
,leadership_roles_1_title
,leadership_roles_1_chamber
,leadership_roles_1_start
,leadership_roles_1_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 1 ||'-'|| 'leadership' 
,id_bioguide
,1
,leadership_roles_1_title
,leadership_roles_1_chamber
,leadership_roles_1_start
,leadership_roles_1_end
FROM book_legislators_historical
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 2 ||'-'|| 'leadership' 
,id_bioguide
,2
,leadership_roles_2_title
,leadership_roles_2_chamber
,leadership_roles_2_start
,leadership_roles_2_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 2 ||'-'|| 'leadership' 
,id_bioguide
,2
,leadership_roles_2_title
,leadership_roles_2_chamber
,leadership_roles_2_start
,leadership_roles_2_end
FROM book_legislators_historical
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 3 ||'-'|| 'leadership' 
,id_bioguide
,3
,leadership_roles_3_title
,leadership_roles_3_chamber
,leadership_roles_3_start
,leadership_roles_3_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 3 ||'-'|| 'leadership' 
,id_bioguide
,3
,leadership_roles_3_title
,leadership_roles_3_chamber
,leadership_roles_3_start
,leadership_roles_3_end
FROM book_legislators_historical
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 'leadership' 
,id_bioguide
,4
,leadership_roles_4_title
,leadership_roles_4_chamber
,leadership_roles_4_start
,leadership_roles_4_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 4 ||'-'|| 'leadership' 
,id_bioguide
,4
,leadership_roles_4_title
,leadership_roles_4_chamber
,leadership_roles_4_start
,leadership_roles_4_end
FROM book_legislators_historical
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 5 ||'-'|| 'leadership' 
,id_bioguide
,5
,leadership_roles_5_title
,leadership_roles_5_chamber
,leadership_roles_5_start
,leadership_roles_5_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 6 ||'-'|| 'leadership' 
,id_bioguide
,6
,leadership_roles_6_title
,leadership_roles_6_chamber
,leadership_roles_6_start
,leadership_roles_6_end
FROM book_legislators_current
;

INSERT into legislators_leadership_roles
SELECT
id_bioguide ||'-'|| 7 ||'-'|| 'leadership' 
,id_bioguide
,7
,leadership_roles_7_title
,leadership_roles_7_chamber
,leadership_roles_7_start
FROM book_legislators_current
;

DELETE 
FROM legislators_leadership_roles
WHERE title is null
;
