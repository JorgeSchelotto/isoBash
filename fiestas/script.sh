#!/bin/bash

if [ $# -ne 3 ]; then
    echo "INVALID PARAMETERS"
    exit 1
fi

# Que no sea numero
[[ $1 == ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit 2

# Que sea numero
[[ $2 != ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit 3

# Que no sea numero
[[ $3 == ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit 4

if [ $2 -le 1 ]; then
    echo "INVALID PARAMETERS $2"
    exit 1
fi


echo "$(cat fiestas-y-festivales.csv | cut -d, -f5 | grep -w -c "^$1")"

cont=0
pos=$(($2-1))
while IFS=, read pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8; do
    if [ $cont -eq $pos ]; then
        festi=$pos7
        break
    fi
    let cont++
done < fiestas-y-festivales.csv

echo "$festi"

echo "$(cat fiestas-y-festivales.csv | cut -d, -f18 | grep -i -c "^$3")"

exit 0