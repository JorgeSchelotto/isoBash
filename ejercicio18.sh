#!/bin/bash

# verifica cada 10 seg si el usuario pasado por parametro conecta


if [ $# -ne 1 ]; then
    echo 'Nop'
    exit 1
fi


while [ 1 -eq 1 ]; do
    for users in $(who); do
        if [ $1 == $users ]; then
            echo "Usuario $1 logueado en el sistema"
            exit 0
        fi
    done
    
    sleep 10
done


exit 0


