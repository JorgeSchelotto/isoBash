#!/bin/bash

# Realice un script que implemente a través de la utilización de funciones las operaciones
# básicas sobre arreglos:
# inicializar: Crea un arreglo llamado array vacío
# agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
# eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la
# posición recibida como parámetro. Debe validar que se reciba una posición válida
# longitud: Imprime la longitud del arreglo en pantalla
# imprimir: Imprime todos los elementos del arreglo en pantalla
# inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud
# <parametro1>y en todas las posiciones asigna el valor <parametro2>



inicializar(){
    arrayVacio=()
}

agregar_elem(){
    if [ $# -ne 1 ]
    then
        echo "Se debe ingresar 1 parametro."
        return 1
    fi
    arrayVacio=(${arrayVacio[*]} $1)
    
    echo "Elemento $1 agregado."
    
    return 0
    
}


eliminar_elem(){
    if [ $# -ne 1 ]
    then
        echo "Se debe ingresar 1 parametro."
        return 1
    fi
    
    if [ $1 -ge $((${#arrayVacio[*]})) ]; then
        echo "Array out of bound."
        return 2
    fi
    
    unset arrayVacio[$1];
    arrayVacio=(${arrayVacio[*]})
    
    echo "Elemento $1 eliminado"
    
    return 0
}

longitud(){
    echo "Longitud ${#arrayVacio[*]}"
}

imprimir(){
    echo ${arrayVacio[*]}
}

inicializar_Con_Valores(){
    
    if [ $# -ne 2 ]
    then
        echo "Se debe ingresar 2 parametros."
        return 1
    fi
    
    for (( i=0 ; i<$1 ; i++ ))
    do
        agregar_elem $2
    done
    
    echo "Arreglo inicializado $1 veces con el valor $2"
}

echo "Elija opcion"

select option in terminar inicializar agregar_elem eliminar_elem longitud imprimir inicializar_Con_Valores
do
    case $option in
        "inicializar")
            inicializar
        ;;
        "agregar_elem")
            echo "Ingrese elemento"
            read elemento
            agregar_elem $elemento
        ;;
        "eliminar_elem")
            echo "Ingrese posicion"
            read posicion
            eliminar_elem $posicion
        ;;
        "longitud")
            longitud
        ;;
        "imprimir")
            imprimir
        ;;
        "inicializar_Con_Valores")
            echo "ingrese posicion"
            read posiciones
            echo "ingrese valor"
            read valor
            inicializar_Con_Valores $posiciones $valor
        ;;
        "terminar")
            echo "Finalizar proceso"
            exit 0
        ;;
        *)
            echo "opcion erronea"
        ;;
    esac
done