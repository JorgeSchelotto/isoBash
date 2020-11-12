#!/bin/bash

# Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
# columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se
# debe guardar el resultado en un archivo llamado reporte.txt

if [ $# -eq 0 ]
then
    echo "Se debe ingresar UN parametro."
    exit 1
fi

for linea in $(cat /etc/passwd | cut -d: -f 1,6); do
    user=$(echo $linea | cut -d: -f1)
    home=$(echo $linea | cut -d: -f2)
    
    echo $user $home
    
    if [ -d $home ]; then
        echo $user  $(find $home -name "*.$1" | wc -l) >> informe.txt
    fi
    
    
done

exit 0