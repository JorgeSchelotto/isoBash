#!/bin/bash

# Compruebo que se reciban parametros
if [ $# -ne 1 ]; then
    echo "INVALID PARAMETERS"
    exit
fi

# Si recibo: X
# Debo Imprimir:
# INVALID PARAMETERS
# Explicación: El script debe recibir solo números
[[ $1 != ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit


# Su script va a recibir un parámetro que debe ser un número y siempre mayor a 0.
if [ $1 -lt 1 ]; then
    echo "INVALID PARAMETERS"
    exit
fi

loteria=$(cat ./2013_2020.csv)
combinaciones=()
for i in ${loteria[@]}; do
    fecha=$(echo $i | cut -d, -f1)
    f2=$(echo $i | cut -d, -f2)
    f3=$(echo $i | cut -d, -f3)
    f4=$(echo $i | cut -d, -f4)
    f5=$(echo $i | cut -d, -f5)
    f6=$(echo $i | cut -d, -f6)
    f7=$(echo $i | cut -d, -f7)
    sum=$((10#${f2} + 10#${f3} + 10#${f4} + 10#${f5} + 10#${f6} + 10#${f7}))
    
    # Si la suma es igual al parametro especificado, lo agrego al arreglo
    if [ $sum -eq $1 ]; then
        combinaciones+=(${fecha})
    fi
done

# Imprimo la cantidad de elementos del parametro
echo ${#combinaciones[@]}

# Imprimo el primer y ultimo elemento del arreglo (en caso de que existan)
if [ ${#combinaciones[@]} -gt 0 ]; then
    echo ${combinaciones[0]}
    # Si tiene más de un elemento, imprimo el ultimo
    if [ ${#combinaciones[@]} -gt 1 ]; then
        echo ${combinaciones[-1]}
    fi
fi
