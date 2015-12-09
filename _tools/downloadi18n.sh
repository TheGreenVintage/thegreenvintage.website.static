#!/bin/bash
FILE="/tmp/thegreenvintage.i18n.csv"

echo "Downloading i18n CSV file..."
rm -f ${FILE}
wget -q -O ${FILE} "https://docs.google.com/spreadsheets/d/13uSnYS9xqWQiuCaZC8-gopAV7n3gx3Mj5tJn31FJSTo/pub?gid=1694880076&single=true&output=csv"
ruby ../_tools/csv2yaml.rb ${FILE}
