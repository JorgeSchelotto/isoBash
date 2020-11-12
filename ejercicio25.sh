#!/bin/bash
# Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
# pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
# “-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso contrario,
# un mensaje de error.
# “-l”: Devuelve la longitud del arreglo
# “-i”: Imprime todos los elementos del arreglo en pantalla



GIU=$(cat /etc/group | grep users | cut -d: -f3)
echo "grupo: $GIU"
arreglo=($(cat /etc/passwd |  grep -w $GIU | cut -d: -f1))

echo  "${arreglo[*]}"

if [ $1 == "-b" ]; then
    
    if [ $# -eq 2 ]; then
        
        if [ $2 -le ${#arreglo[*]} ]; then
            echo  "${arreglo[$2]}"
        fi
    else
        echo "Falta un parametro"
        exit 1
    fi
fi

if [ $1 == "-l" ]; then
    echo  "${#arreglo[*]}"
fi

if [ $1 == "-i" ]; then
    echo  "${arreglo[*]}"
fi


exit 0
