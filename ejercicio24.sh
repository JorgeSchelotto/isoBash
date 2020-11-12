#!/bin/bash

numA=(10 3 5 7 9 3 5 4)
numB=(10 3 5 7 9 3 5 4)


for (( i=0; i<${#numA[*]}; i++ )); do
    
    echo "La suma de los elementos de la posicion $i es: $(( ${numA[i]} + ${numB[i]} ))"
    
done