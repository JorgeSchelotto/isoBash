#!/bin/bash

num=(10 3 5 7 9 3 5 4)
cont=0
for i in ${num[*]}; do
    if [ $(($i % 2)) -eq 0 ]; then
        echo "Par: $i"
    else
        let cont++
    fi
    
    
done
echo "Impares: $cont"
exit 0