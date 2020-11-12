#! /bin/bash

listaFromCvs=$(cat input.csv | cut -d" " -f1)

salida=""
cont=0
$salida > salida.csv
for i in ${listaFromCvs[*]}; do
    
    if [ $cont -lt 2 ]
    then
        salida="$salida$i---"
        let cont++
    else
        salida="$salida$i"
        echo -e $salida >> salida.csv
        echo $salida
        salida=""
        cont=0
    fi
done


exit 0