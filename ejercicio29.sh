#!/bin/bash

# Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
# terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
# acceder a la estructura creada:
# -- verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
# encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no en-
#  y devuelve como valor de retorno 5
# -- cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc
# -- borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archi-
# vo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
# usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
# validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
# de error “Archivo no encontrado” y devuelve como valor de retorno 10


files=()
file=($( find /home/$(whoami) -maxdepth 1 -name "*.doc"))

cantidadArchivos(){
    echo "Cantidad de archivos: ${#file[*]}"
}

verArchivo(){
    pos=-1
    for (( i=0; i<${#file[*]}; i++ )); do
        
        if [ ${file[$i]} == $1 ]; then
            pos=$i
        fi
    done
    
    
    if [ $pos -ne -1 ]; then
        echo "$(cat ${file[$pos]})"
    else
        echo "El archivo no existe."
    fi
}



select option in cantidadArchivos verArchivo
do
    case $option in
        "cantidadArchivos")
            cantidadArchivos
        ;;
        "verArchivo")
            echo "Nombre archivo"
            read var
            verArchivo $var
        ;;
    esac
    
done
