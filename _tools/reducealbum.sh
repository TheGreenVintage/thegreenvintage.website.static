#!/bin/bash

for X in `find . -maxdepth 1 -type f -not -path "./thumbnails"`; do

  if [ ! -f "./thumbnails/${X}" ]; then
    echo "Generating thumbnail for ${X}..."
    convert  -resize 358x -strip -interlace Plane -quality 85 "${X}" "./thumbnails/${X}"
  fi

  if [[ $(find ${X} -type f -size +204800c 2>/dev/null) ]]; then
    echo "Resizing ${X}..."
    convert  -resize 800x -strip -interlace Plane -quality 95 "${X}" "${X}"
  fi
done

#count=1
#for i in `ls -1 | grep -v thumb.jpg`*; do
#  mv "${i}" picture`echo "${count}" | awk '{printf("%02d\n", $1)}'`.`echo "${i}" | awk -F. '{print tolower($2)}'`
#  ((++count))
#done
