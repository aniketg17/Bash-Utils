#!/bin/bash

score=0
if [ -e $1 ]
then
  PASSWORD=$(< $1)
  COUNT=${#PASSWORD}

  if [ $COUNT -lt 6 -o $COUNT -gt 32 ]
  then
    echo "Error: Password length invalid."
  else
    let score=$score+${#PASSWORD}
    if egrep -q [#$\+%@] $1
    then
      let score=$score+5
    fi

    if egrep -q [0-9] $1
    then
      let score=$score+5
    fi

    if egrep -q [A-Za-z] $1
    then
      let score=$score+5
    fi

    if egrep -q [A-Z][A-Z][A-Z] $1
    then
      let score=$score-3
    fi

    if egrep -q [0-9][0-9][0-9] $1
    then
      let score=$score-3
    fi

    if egrep -q [a-z][a-z][a-z] $1
    then
      let score=$score-3
    fi

    if egrep -q '([0-9A-Za-z])\1+' $1
    then
      let score=$score-10
    fi

    echo "Password Score: $score"

  fi

else
  echo "File does not exist"
fi
