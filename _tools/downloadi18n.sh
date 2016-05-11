#!/bin/bash
FILE="/tmp/thegreenvintage.i18n.csv"

echo "Downloading i18n CSV file..."
rm -f ${FILE}
wget -q -O ${FILE} "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=0&single=true&output=csv"
ruby ../_tools/csv2yaml.rb ${FILE}
