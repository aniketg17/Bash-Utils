#!/bin/bash

function valid {
    count=${#1}

    if [[ $1 =~ ^1[[:space:]]{1}\([0-9]{3}\)[[:space:]]{1}[0-9]{3}[[:space:]]{1}[0-9]{4}$ ]]
    then
        echo "valid"
        return
    fi
    if [[ $1 =~ ^\([0-9]{3}\)[[:space:]]{1}[0-9]{3}[[:space:]]{1}[0-9]{4}$ ]]
    then
        echo "valid"
        return
    else
        echo "invalid"
    fi
}

if [ $# -lt 1 -o $# -gt 1 ]; then
    echo "Error"
    exit
fi
valid "$1"

