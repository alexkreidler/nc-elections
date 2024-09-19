# NC Elections Data

Sources: NCSBE Voter Registration, History, and Precinct Data
NSLVE Campus Reports
IRS SOI County-to-County migration data
UNC Residence Hall Addresses (https://housing.unc.edu/live/resident-resources/mail-packages/whats-my-address/)

Voter Registration
https://www.ncsbe.gov/results-data/voter-registration-data
https://s3.amazonaws.com/dl.ncsbe.gov/data/layout_ncvoter.txt

Voter History
https://www.ncsbe.gov/results-data/voter-history-data
https://s3.amazonaws.com/dl.ncsbe.gov/data/layout_ncvhis.txt

```
SELECT first_name, last_name, res_street_address, res_city_desc, registr_dt, age_at_year_end, gender_code, race_code FROM voter_registration_orange WHERE res_street_address LIKE
 '%EHRINGHAUS%' ORDER BY registr_dt DESC LIMIT 100;

SELECT first_name, middle_name, last_name, res_street_address, res_city_desc, registr_dt, age_at_year_end, gender_code, race_code, voter_status_desc, voter_status_reason_desc FROM voter_registration_orange WHERE res_street_address LIKE '%450  EHRINGHAUS%' ORDER BY registr_dt DESC LIMIT 50;
```


When Mail and Early Voting start, we can see in real-time who has returned ballots/voted
https://www.ncsbe.gov/results-data/absentee-and-provisional-data
https://s3.amazonaws.com/dl.ncsbe.gov/ENRS/layout_absentee.txt

"Before early voting begins, only returned mail-in ballots are included. Between the start of early voting and election day, include all early voting ballots cast as well. Starting on election day include all mailed and early voting ballots."

https://carolinademography.cpc.unc.edu/2020/10/28/half-of-ncs-7-3-million-registered-voters-have-already-voted/
