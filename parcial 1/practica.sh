# Se tiene un archivo con el resultado histórico de una Loteria, el archivo está delimitado por
# comas (archivo adjunto 2013_2020.csv). Por favor analice imagen adjunta (loteria.jpg) para ver la estructura
# del archivo.
# Su script va a recibir un parámetro que debe ser un número y siempre mayor a 0.
# El parámetro representa la suma de valores para la combinación ganadora. La combinación ganadora
# son los números de las columnas 2 a la 7 inclusive. Tenemos que encontrar la cantidad de
# sorteos en los que la suma de los números de la combinación ganadora coincide con el parámetro recibido.
# Ademas debemos imprimir la fecha de la primer y ultima coincidencia que encontramos en el archivo
# primera y última según el orden del archivo no en orden temporal)
# Por ejemplo si recibo
# 180
# Debo Imprimir:
# 3
# 24/10/2020
# 1/02/2018

# Compruebo que se reciban parametros
if [ $# -ne 1 ]; then
    echo "INVALID PARAMETERS"
    exit 1
fi

# Si recibo: X
# Debo Imprimir:
# INVALID PARAMETERS
# Explicación: El script debe recibir solo números
[[ $1 != ?(-)+([0-9]) ]] && echo "INVALID PARAMETERS" && exit 2

# Su script va a recibir un parámetro que debe ser un número y siempre mayor a 0.
if [ $1 -lt 1 ]; then
    echo "INVALID PARAMETERS"
    exit 3
fi

cont=0
fechas=()
while IFS=, read fecha num1 num2 num3 num4 num5 num6 num7; do
    
    # echo "$(( 10#$num1 + 10#$num2 + 10#$num3 + 10#$num4 + 10#$num5 + 10#$num6 ))"
    
    sum=$(( 10#$num1 + 10#$num2 + 10#$num3 + 10#$num4 + 10#$num5 + 10#$num6 ))
    
    if [ $sum -eq $1 ]; then
        let cont++
        fechas=(${fechas[*]} $fecha)
    fi
    
    
done < 2013_2020.csv


echo -e "$cont\n${fechas[1]}\n${fechas[$((${#fechas[*]}-1))]}"

exit 0