#!/bin/bash

for X in `ls -1 | grep -v thumb.jpg`; do
  echo "Compresing ${X}..."
  convert  -resize 800x -strip -interlace Plane -quality 85 "$X" "$X"
done

count=1
for i in `ls -1 | grep -v thumb.jpg`*; do
  mv "${i}" picture`echo "${count}" | awk '{printf("%02d\n", $1)}'`.`echo "${i}" | awk -F. '{print tolower($2)}'`
  ((++count))
done
