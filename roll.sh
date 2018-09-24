#!/bin/bash

die=$1
rolls=${die%%d*}
min=1
right=${die##*d}
max=${right%%+*}
modifier=0
modifieroperation='add'

if [[ $right = *"+"* ]]; then
  modifier=${die##*+}
  modifieroperation='add'
fi

if [[ $right = *"-"* ]]; then
  modifier=${die##*-}
  modifieroperation='subtract'
fi

echo 'Rolling:      '$die

result=`jot -r $rolls $min $max`

total=0

n=1
while [ $n -le $rolls ]
do
    rollval=`jot -r 1 $min $max`
    total=$((total + rollval))

    echo 'Die '$n':        '$rollval

    ((n++))
done
echo 'Die Total:   ' $total

if [[ $modifieroperation = "add" ]]; then
    total=$((total + modifier))
fi

if [[ $modifieroperation = "subtract" ]]; then
    total=$((total - modifier))
fi

echo 'Final Result: '$total
