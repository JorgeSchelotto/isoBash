#!/bin/bash

# Hacer un script que renombre solo archivos de un directorio pasado
# como parametro agregandole una cadena: -a cadena agrega al final, -b cadena agrega al inicio del nombre

echo $(ls | tr  [:lower:][:upper:] [:upper:][:lower:] | tr -d "aA" )
exit 0



