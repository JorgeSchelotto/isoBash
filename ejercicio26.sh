#!/bin/bash
# Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invo-
# cación (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta
# de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros reci-
# bidos, y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, el q
# verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo
# de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o
# directorios inexistentes en el sistema.


if [ $# -lt 1 ]; then
    echo "Al menos un parametro papu"
    exit 1
fi
inexis=0
array=($*)
for (( i=0; i<$#; i++ )); do
    if [ $((i%2)) -ne 0 ]; then
        if [ -e ${array[$i]} ]; then
            if [ -d ${array[$i]} ]; then
                echo "${array[$i]} es un directorio."
            fi
            if [ -f ${array[$i]} ]; then
                echo "${array[$i]} es un archivo."
            fi
        fi
    fi
    if [ ! -e ${array[$i]} ]; then
        inexis=$(( $inexis + 1 ))
    fi
done

echo "No existen $inexis"
