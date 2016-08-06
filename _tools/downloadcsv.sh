#!/bin/bash

echo "Downloading CSV files..."
wget -q -O "../_data/destinations.csv" "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=1539468359&single=true&output=csv"
wget -q -O "../_data/activities.csv"   "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=802183433&single=true&output=csv"
wget -q -O "../_data/employees.csv"    "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=261678603&single=true&output=cs"
wget -q -O "../_data/home.csv"         "https://docs.google.com/spreadsheets/d/1DXPTtb1tN-4HCwsLhMGICMxQrg8b28w1CnMAhT90rFo/pub?gid=125310584&single=true&output=csv"

dos2unix ../_data/*
