#! /bin/bash

URL_PREFIX=https://www.data.gouv.fr/s/resources/depenses-d-assurance-maladie-hors-prestations-hospitalieres-par-caisse-primaire-departement/

URLS_SUFFIXES=(
  20150204-184219/R_2014_sans_lib.zip
  20150204-185903/R_2013_sans_lib.zip
  20150204-194455/R_2012_sans_lib.zip
  20150204-195049/R_2011_sans_lib.zip
  20150204-195657/R_2010_sans_lib.zip
)

if [ ! -d "data" ]; then mkdir data; fi
if [ ! -d "tmp" ]; then mkdir tmp; fi

for URL in ${URLS_SUFFIXES[*]}
do
  wget -P tmp/ $URL_PREFIX$URL
done
unzip -d data 'tmp/*'
#rm -rf tmp

wget ${URL_PREFIX}20150204-182119/Lexique_tables_R.zip -O tmp.zip && unzip tmp.zip && rm tmp.zip && mv Lexique\ tables\ R data/lookup
