#!/bin/bash

for file in $1*; do
    name=$file
    newname="$name.txt"
    mv -i $name $newname
    echo $newname
done
