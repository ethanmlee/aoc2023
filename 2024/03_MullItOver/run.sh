#!/bin/sh

for file in "$@"; do
  silver=0
  while read -r line; do
    mul=$(echo "$line" | grep -oP 'mul\([0-9]{1,3},[0-9]{1,3}\)')
    for each in $mul; do
      x=$(echo ${each%,*} | cut -c 5-)
      y=$(echo ${each#*,} | rev | cut -c 2- | rev)

      echo $x $y

      silver=$(( $x * $y + $silver ))



    done

  done < "$file"

  echo
  echo $silver

done
