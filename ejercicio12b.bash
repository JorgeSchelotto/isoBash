#!/bin/bash
# Operaciones con parametros

if [ $# -ne 2 ]; then
    echo 'Ingresa bien los parametros paparulo.'
    exit 1
fi

echo $(($1*$2))
echo $(($1+$2))
echo $(($1-$2))

if [ $1 -gt $2 ]; then
    echo "el mayor es $1"
    elif [ $1 -eq $2 ]; then
    echo "$1 = $2"
else
    echo "el mayor es $2"
fi

exit 0