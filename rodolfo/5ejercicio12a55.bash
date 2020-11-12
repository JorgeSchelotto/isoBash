#!/bin/bash
# operaciones desde entrada estandar

echo 'Ingrese dos numeros'
echo 'numero A'
read numA
echo 'numero B'
read numB


echo $(($numA*$numB))
echo $(($numA+$numB))
echo $(($numA-$numB))

if [ $numA -gt $numB ]; then
    echo "el mayor es $numA"
    elif [ $numA -eq $numB ]; then
    echo "$numA = $numB"
else
    echo "el mayor es $numB"
fi