DROP table if exists legislators;

CREATE table legislators
(
full_name varchar--name_official_full
,first_name varchar --name_first
,last_name varchar --name_last
,middle_name varchar --name_middle
,nickname varchar --name_nickname
,suffix varchar --name_suffix
,other_names_end date -- other_names_0_end date
,other_names_middle varchar -- other_names_0_middle
,other_names_last varchar -- other_names_0_last
,birthday date -- bio_birthday
,gender varchar-- bio_gender
,id_bioguide varchar primary key
,id_bioguide_previous_0 varchar
,id_govtrack int
,id_icpsr int
,id_wikipedia varchar
,id_wikidata varchar
,id_google_entity_id varchar
,id_house_history bigint
,id_house_history_alternate int
,id_thomas int
,id_cspan int
,id_votesmart int
,id_lis varchar
,id_ballotpedia varchar
,id_opensecrets varchar
,id_fec_0 varchar
,id_fec_1 varchar
,id_fec_2 varchar
)
;

INSERT into legislators
(
full_name --name_official_full
,first_name --name_first
,last_name --name_last
,middle_name --name_middle
,nickname --name_nickname
,suffix --name_suffix
,other_names_last -- other_names_0_last
,birthday -- bio_birthday
,gender -- bio_gender
,id_bioguide 
,id_govtrack
,id_icpsr
,id_wikipedia
,id_wikidata
,id_google_entity_id
,id_house_history
,id_thomas
,id_cspan
,id_votesmart
,id_lis
,id_ballotpedia
,id_opensecrets
,id_fec_0
,id_fec_1
,id_fec_2
)
SELECT 
case when name_official_full is null and name_middle is null then name_first ||' '||name_last
     when name_official_full is null then name_first||' '|| name_middle ||' '|| name_last
     else name_official_full end
,name_first
,name_last
,name_middle
,name_nickname
,name_suffix
,other_names_0_last
,bio_birthday
,bio_gender
,id_bioguide 
,id_govtrack
,id_icpsr
,id_wikipedia
,id_wikidata
,id_google_entity_id
,id_house_history
,id_thomas
,id_cspan
,id_votesmart
,id_lis
,id_ballotpedia
,id_opensecrets
,id_fec_0
,id_fec_1
,id_fec_2
FROM book_legislators_current
;

INSERT into legislators
(
full_name --name_official_full
,first_name --name_first
,last_name --name_last
,middle_name --name_middle
,nickname --name_nickname
,suffix --name_suffix
,other_names_end -- other_names_0_end date
,other_names_middle -- other_names_0_middle
,other_names_last -- other_names_0_last
,birthday -- bio_birthday
,gender -- bio_gender
,id_bioguide 
,id_bioguide_previous_0
,id_govtrack
,id_icpsr
,id_wikipedia
,id_wikidata
,id_google_entity_id
,id_house_history
,id_house_history_alternate
,id_thomas
,id_cspan
,id_votesmart
,id_lis
,id_ballotpedia
,id_opensecrets
,id_fec_0
,id_fec_1
,id_fec_2
)
SELECT 
case when name_official_full is null and name_middle is null then name_first ||' '||name_last
     when name_official_full is null then name_first||' '|| name_middle ||' '|| name_last
     else name_official_full end
,name_first
,name_last
,name_middle
,name_nickname
,name_suffix
,other_names_0_end
,other_names_0_middle
,other_names_0_last
,bio_birthday
,bio_gender
,id_bioguide 
,id_bioguide_previous_0
,id_govtrack
,id_icpsr
,id_wikipedia
,id_wikidata
,id_google_entity_id
,id_house_history
,id_house_history_alternate
,id_thomas
,id_cspan
,id_votesmart
,id_lis
,id_ballotpedia
,id_opensecrets
,id_fec_0
,id_fec_1
,id_fec_2
FROM book_legislators_historical
;
