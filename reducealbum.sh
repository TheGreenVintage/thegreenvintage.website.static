#!/bin/bash

for X in *; do
  convert "$X" -resize 800x -strip -quality 86 "$X";
done

count=1
for i in *; do
  mv "${i}" picture`echo "${count}" | awk '{printf("%02d\n", $1)}'`.`echo "${i}" | awk -F. '{print tolower($2)}'`
  ((++count))
done
