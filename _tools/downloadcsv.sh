#!/bin/bash

echo "Downloading CSV files..."
wget -q -O "../_data/destinations.csv" "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=1539468359&single=true&output=csv"
wget -q -O "../_data/activities.csv"   "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=802183433&single=true&output=csv"
wget -q -O "../_data/employees.csv"    "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=261678603&single=true&output=csv"
wget -q -O "../_data/tours"            "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=2078551218&single=true&output=csv"
wget -q -O "../_data/home.csv"         "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=125310584&single=true&output=csv"

dos2unix ../_data/*
