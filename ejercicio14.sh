#!/bin/bash

# Hacer un script que renombre solo archivos de un directorio pasado
# como parametro agregandole una cadena: -a cadena agrega al final, -b cadena agrega al inicio del nombre

if [ $# -ne 3 ]; then
    echo "Error in parameter paparuleitor"
    exit 1
fi

if [ ! -d $2 ]; then
    echo "$1 No es un directorio válido."
    echo "Saliendo status 2"
    exit 2
fi

for i in $(ls $2 )
do
    case $1 in
        "-b")
            mv "$2$i" "$2$3$i"
        ;;
        "-a")
            nombre=$(echo $i | cut -d. -f1)
            exte=$(echo $i | cut -d. -f2)
            mv "$2$i" "$2$nombre$3.$exte"
            
        ;;
        *)
            echo "le erraste feo machirulo. Las opciones son -a o -b"
        ;;
    esac
done

exit 0



