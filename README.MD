# Ejercicios de practica para la materia ISO

# UNLP - Fac. Informatica

# Resumen Bash:

# Referencia: https://unix-tech.in/important-linux-commands-cheat-sheet/

# https://linuxhint.com/30_bash_script_examples/

# Para entender /etc/passwd: https://www.cyberciti.biz/faq/# understanding-etcpasswd-file-format/

Consideraciones: siempre preguntar si hay parámetros y si son la cantidad que necesito. En caso de que sea la pos de un vector ver que no me pase del tamaño del vector. Si es archivo ver si existe.
if [ ! $# -eq $loquenecesito ]; then
exit 1
fi
if [ ! -e $1 ]; then (suponiendo que \$1 es un directorio)
exit 1
fi

if [ $1 -ge ${#vector[*]} ]; then (suponiendo que \$1 es un indice a buscar en un vector)
exit 1
fi

Sustitución de comandos

$(ls): lo que esta esta en ls
`ls`: idem arriba
$((5+6)): el resultado de la operacion
let 5 + 6; expr 5 + 6: idem arriba
let $var++: incrementa.
let $var--: decrementa
let $var+=$var2: suma o concatena
“$var es una variable”: concatena ( ‘’ no concatena)
“${var}.txt”: en algunos casos para concatenar se usa esta forma, pero es casi igual a hacer “\$var.txt”

Comandos basicos
tr: cambia caracteres tr [:lower:][:upper:] [:upper:][:lower:] cambia mayusculas por minusculas y minusculas por mayusculas
tr -d "aA" elimina a o A
cat /path/archivo/: lee archivo
cp: copia el contenido
chmod: para otorgar permisos
mv: mueve archivos. Ej: mv /path/archivo/ /path/archivoCopiado/
wc -l: contas lineas
who: lista de usuarios logeados
ls: archivos en el directorio
ls -l archivo: en la f1 estan los permisos
grep: para buscar en archivo https://www.hostinger.com.ar/tutoriales/comando-grep-linux/
awk:
\$?: resultado de la ultima ejecucion (0 ok, otra cosa error)

Tamaño del directorio de todos los usuarios:
cat /etc/passwd | cut -d: -f6 | du -h

Archivos
Leer archivo:
cat /archivo/

Comparacion if:

if [ -e $archivo ]; then
fi
if [ ! -z $var ]; then
fi

-n: True Si el tamaño del string es mayor que 0
-z: True si la variable está vacía
-e: pregunta si el archivo existe
-d: pregunta si es directorio
-f: pregunta si es archivo
-h: existe y es link simbólico
-r: existe y es de solo lectura
-w: existe y es de escritura
-x: existe y es ejecutable

Vectores

vacio: vec=()
cargar: vec=( 1 2 3 4 5 )
tamaño: ${#vec[*]}
leer todo: ${vec[*]}
leer pos: ${vec[1]}
borrado: 
unset vec[0]
vec=${vec[*]}

Parametros de entrada (para script y funciones)

$#: cantidad pasada
$\*: lista todos los parametros
$1, $2, $3: para usar los parametros
${!\$#}: ultimo parametro

Funciones

Return solo numeros del 0 al 255. 0 = ok, el resto error. Corta la ejecucion (Similar exit, pero exit es para todo el script)
function name{}
name(){}

Ejemplo menu de usuario
echo "Elija opción"

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
           inicializar_Con_Valores $posiciones \$valor
;;
"terminar")
echo "Finalizar proceso"
exit 0
;;
\*)
echo "opcion erronea"
;;
esac
done

Leer archivo linea a linea guardando los campos

#!/bin/bash
Se puede ejecutar en consola

file="/etc/passwd"
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do # display fields using f1, f2,..,f7
printf 'Username: %s, Shell: %s, Home Dir: %s\n' "$f1" "$f7" "$f6"
done <"$file"
done <<<"\$(comando)"

awk -F";" 'FNR == '''$1''' {print $'''\$2'''}' aeropuertos_detalle.csv

Para saber usuarios normales
getent passwd {1000..60000}
