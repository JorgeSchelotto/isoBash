#!/bin/bash

#Recibirá 2 parámetros que se corresponde a un país (segunda columna) y un orden de prioridad (quinta columna)

if [ $# -ne 2 ]; then
    echo "INVALID PARAMETERS"
    exit 1
fi

#------Primero deberá formar un array que contenga todos los items de ese país para esa prioridad.
#echo $( cat 100_Sales_Records.csv | cut -d , -f2 -f3 -f5 | grep -w $1 | grep -w $2 )
array=( $( cat 100_Sales_Records.csv | cut -d , -f2 -f3 -f5 | grep -w $1 | grep -w $2  | cut -d , -f2))
#echo ${array[*]}

#------Ademas deberá calcular el total de unidades vendidas(columna 9) para el país y prioridad ingresada.
array2=( $( cat 100_Sales_Records.csv | cut -d , -f2 -f5 -f9 | grep -w $1 | grep  -w $2 | cut -d, -f3) )
let tot_uni=0
for i in ${array2[*]}; do
	let tot_uni=$tot_uni+$i
done
#echo ${#array[@]}
#-----Segundo deberá imprimir los elementos del vector que formo en la tarea anterior 
#-----(imprimir en pantalla los elementos del vector) y el total de unidades vendidas.
if [ ${#array[@]} -ge 1 ]; then
    for i in ${array[@]}; do
      echo  $i
    done
    echo $tot_uni 
    exit 0
else
    exit 2
fi
