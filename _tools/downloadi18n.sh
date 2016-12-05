#!/bin/bash
FILE="/tmp/thegreenvintage.i18n.csv"

echo "Downloading i18n CSV file..."
rm -f ${FILE}

wget -q -O ${FILE} "https://docs.google.com/spreadsheets/d/e/2PACX-1vSSl8MxVlbv1b9IbkQXcHVmyGFNMFzFEMKk4cabvb0qIcBkBro3Vg2Wfslwg8DlRYZdltb9FYo3DHl7/pub?gid=0&single=true&output=csv"
ruby ../_tools/csv2yaml.rb ${FILE}
