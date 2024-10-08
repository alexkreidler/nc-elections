#!/bin/bash
mkdir -p workdir
mkdir -p data

cd workdir
# Cleanup previous versions
rm ./ncvoter68*
rm ./ncvhis68*

wget https://s3.amazonaws.com/dl.ncsbe.gov/data/ncvoter68.zip
wget https://s3.amazonaws.com/dl.ncsbe.gov/data/ncvhis68.zip
unzip ncvoter68.zip;
unzip ncvhis68.zip;

iconv -f ISO-8859-1 -t UTF-8 ./ncvoter68.txt > utf_voters.tsv
iconv -f ISO-8859-1 -t UTF-8 ./ncvhis68.txt > utf_history.tsv

duckdb db.duckdb "CREATE OR REPLACE TABLE voter_registration_orange AS SELECT * FROM read_csv('utf_voters.tsv', delim='\t'); CREATE OR REPLACE TABLE voter_history_orange AS SELECT * FROM read_csv('utf_history.tsv', delim='\t');"
# handle invalid dates in new data?
duckdb db.duckdb "ALTER TABLE voter_registration_orange ADD COLUMN date DATE; UPDATE voter_registration_orange SET date = try_strptime(registr_dt, '%m/%d/%Y');"
duckdb db.duckdb "COPY voter_registration_orange TO 'voter_registration_orange.parquet' (FORMAT 'parquet'); COPY voter_history_orange TO 'voter_history_orange.parquet' (FORMAT 'parquet');"
mv *.parquet ../data/

cd ../