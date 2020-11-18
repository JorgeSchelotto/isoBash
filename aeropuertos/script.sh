#!/bin/bash
#region
# Ejercicio shell scripting - T2
# Se tiene un archivo con el listado de Información de los Aeropuertos de la República Argentina
# archivo adjunto aeropuertos_detalle.csv) con la siguiente Información:
# En la primer fila se encuentra el encabezado con el título de las columnas(separados por ";").
# Por ejemplo:
# local;oaci;iata;tipo;denominacion;coordenadas;latitud;longitud;elev;uom_elev;ref;distancia_ref;
# direccion_ref;condicion;control;region;fir;uso;trafico;sna;concesionado;provincia;inhab
# Luego, cada fila del archivo contiene la lista de valores para cada columna también separados
# por punto y coma(;).
# Su script va a recibir los siguientes parámetros:
# 1) El primero es un número de FILA(siempre debe ser mayor a 1, ya que en la primer fila tenemos
# el título de las columnas, y menor a la cantidad de filas del archivo).
# 2) El segundo es un número de COLUMNA(siempre debe ser mayor a 0).
# Su script debe devolver 3 valores(en el orden que se indica):
# -El valor de la fila indicada en el primer parámetro para la columna indicada en el segundo
# parámetro.
# -El título de la columna(lo obtenemos de la primer fila).
# -La cantidad de filas que poseen el valor indicado en la columna indicada..
# Ejemplos:
# 1) Si recibo 10 y 4 debo devolver:
# Aeródromo
# tipo
# 566
#endregion
#region if
if [ $# -ne 2 ]; then
    echo "INVALID PARAMETER"
    exit 1
fi

[[ $1 != ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit 2
[[ $2 != ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit 3
cant=$( cat aeropuertos_detalle.csv | wc -l )
if [ $1 -le 1 ] && [ $1 -le $cant ]; then
    echo "INVALID PARAMETER"
    exit 4
fi

if [ $2 -le 0 ]; then
    echo "INVALID PARAMETER"
    exit 5
fi
#endregion

# array=()
# cont=0
# for i in $(cat aeropuertos_detalle.csv | cut -d';' -f$2 | awk 'FNR == 2 {print}' ); do
#    array=(${array[*]} $i)
#    let cont++
#    if [ $cont -gt $1 ]; then
#        break
#    fi
# done
# echo "${array[$1]}"

echo "$(cat aeropuertos_detalle.csv | cut -d';' -f$2 | awk "FNR == $1 {print}")"
echo "$(cat aeropuertos_detalle.csv | cut -d';' -f$2 | awk "FNR == 1 {print}")"
find="$(cat aeropuertos_detalle.csv | cut -d';' -f$2 | awk "FNR == $1 {print}")"
echo "$(cat aeropuertos_detalle.csv | cut -d';' -f$2 | grep -i -c "$find")"






