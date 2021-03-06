#!/bin/bash

# Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
# el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
# directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
# para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
# dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
# tampoco deberán ser tenidos en cuenta para la suma a informar.

if [ $# -lt 1 ]; then
    echo "N° de parametros incorrectos."
    exit 0
fi


lectura=0
escritura=0
for archivo in $(ls "$1"); do
    
    if [ -f $archivo ]; then
        if [ -r $archivo ]; then
            lectura=$(expr $lectura + 1)
        fi
        if [ -w $archivo ]; then
            escritura=$(expr $escritura + 1)
        fi
        echo "$archivo"
    fi
done
echo "Lectura: $lectura"
echo "Escritura: $escritura"