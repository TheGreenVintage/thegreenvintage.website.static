#!/bin/bash

echo "Downloading CSV files..."
wget -q -O "../_data/portfolio.csv" "https://docs.google.com/spreadsheets/d/13uSnYS9xqWQiuCaZC8-gopAV7n3gx3Mj5tJn31FJSTo/pub?gid=0&single=true&output=csv"
wget -q -O "../_data/partners.csv" "https://docs.google.com/spreadsheets/d/13uSnYS9xqWQiuCaZC8-gopAV7n3gx3Mj5tJn31FJSTo/pub?gid=1075509751&single=true&output=csv"

dos2unix ../_data/*
