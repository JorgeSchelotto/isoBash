#!/bin/bash
# Calculadora

if [ $# -ne 3 ]; then
    echo "$# Ingresa bien los parametros paparulo."
    exit 1
fi


case $3 in
    "+")
        echo "$(($1+$2))"
    ;;
    "-")
        echo "$(($1-$2))"
    ;;
    "*")
        echo "$(($1*$2))"
    ;;
    "/")
        echo "$(($1/$2))"
    ;;
    *)
        echo "Operacion invalida $3"
    ;;
esac