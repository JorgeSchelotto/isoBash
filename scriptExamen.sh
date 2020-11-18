#!/bin/bash

if [ $# -ne 1 ]; then
    echo 'Numero de parametros incorrecto'
    exit 1
fi

if [ $1 -ne 1 ] || [ $1 -ne 2 ]; then
    echo 'El único parámetro de entrada debe ser 1 o 2'
    exit 2
    elif [ $1 -ne 1 ]; then
    echo "A"
    echo "B"
    elif [ $1 -ne 2 ]; then
    echo "C"
    echo "D"
fi

exit 0


