#!/bin/bash

for X in `ls -1 | grep -v thumbnails`; do

  if [ ! -f "./thumbnails/${X}" ]; then
    echo "Generating thumbnail for ${X}..."
    convert  -resize 228x -strip -interlace Plane -quality 80 "${X}" "./thumbnails/${X}"
  fi

  echo "Resizing ${X}..."
  convert  -resize 800x -strip -interlace Plane -quality 95 "${X}" "${X}"
done

#count=1
#for i in `ls -1 | grep -v thumb.jpg`*; do
#  mv "${i}" picture`echo "${count}" | awk '{printf("%02d\n", $1)}'`.`echo "${i}" | awk -F. '{print tolower($2)}'`
#  ((++count))
#done
