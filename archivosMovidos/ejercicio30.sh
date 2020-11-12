#!/bin/bash

# Realice un script que mueva todos los programas del directorio actual (archivos ejecutables)
# hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script
# debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o
# que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado.

cont=0
mkdir -p archivosMovidos 
while IFS= read "archivo"; do

    if [ -f "$archivo" ]; then
        if [ -x "$archivo" ]; then
            echo "$archivo"
            cp "$archivo" archivosMovidos
            let cont++
        fi
    fi
done <<< $(ls)


echo "Se movieron $cont archivos."

exit 0