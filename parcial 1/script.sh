#!/bin/bash/

if [ $# -ne 1 ]; then
    echo "numerosero de parametros incorrectos."
    echo "Son necesarios solo un parametro"
    exit 1
fi

numeros='^[0-9]+$'
if ! [[ $1 =~ $numeros ]] ; then
    echo "El parametro debe ser un numerosero"
    exit 3
fi

if [ $1 -le 0 ]; then
    echo "$1"
    echo "El parametro tiene que ser un numerosero mayor a 0"
    exit 2
fi



cont=0
fecha=0
numeros=0

while IFS=, read ganadores1 ganadores2 ganadores3 ganadores4 ganadores5 ganadores6 ganadores7 ganadores8 ganadores9 ganadores10; do
    let "suma = 10#$ganadores2 + 10#$ganadores3 + 10#$ganadores4 + 10#$ganadores5 + 10#$ganadores6 + 10#$ganadores7"
    
    if [ $1 -eq $suma ]; then
        numeros=$(($numeros + 1))
        if [ ${fecha} -eq 0 ]; then
            fecha=1
            primeraFecha=${ganadores1}
        else
            ultimaFecha=${ganadores1}
        fi
    fi
done < 2013_2020.csv

echo $numeros
if [ $numeros -gt 0 ]; then
    echo $primeraFecha
    if [ $numeros -gt 1 ]; then
        echo $ultimaFecha
    fi
fi
