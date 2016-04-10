#!/bin/bash

echo "Downloading CSV files..."
wget -q -O "../_data/destinations.csv" "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=1539468359&single=true&output=csv"
wget -q -O "../_data/activities.csv"   "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?gid=802183433&single=true&output=csv"
wget -q -O "../_data/home.csv"         "https://docs.google.com/spreadsheets/d/1e2hsPriBILVB0pZzZketUhcRAJq7IuYNAb-al3HbxjQ/pub?output=csv"

dos2unix ../_data/*
