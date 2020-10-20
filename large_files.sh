#!/bin/bash
#usage: large_files <limit>

for file in *; do
    if [ -d $file ]; then
        continue
    fi
    name=$file
    size=$(wc -c $file | awk '{print $1}')
    if [ $size -gt $1 ]; then
        echo $name
    fi
done

