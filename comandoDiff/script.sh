# Utilizando el comando diff, ud debe comparar todos los archivos provenientes de S y P:
# 1) Desempaquetar input.tar
# 2) Inicializar un arreglo y en cada posición del arreglo debe registrar el resultado
# de la comparación de archivos de s y p.
# 0(cero) si NO hay diferencias entre los archivos si y pi.
# 1(uno) si hay diferencias entre los archivos si y pi .
# Finalmente debe imprimir en pantalla el arreglo resultante y luego y en otra linea,
# la cantidad total de diferencias detectadas.
# Por ejemplo:
# Si el archivo input.tar tiene 3 pares de archivos:
# S1,S2,S3
# P1,P2,P3
# y además:
#S1 es igual a P1,
#S2 es DISTINTO a P2
#S3 es igual a P3
#El resultado será
#0 1 0
#1

cant=$(tar -xvf input.tar | wc -l)
vec=()

for (( i=1; i<=$(($cant/2)); i++ ));do
    dif=$(diff -w s$i p$i)
    vec=(${vec[*]} $?)
done

cant=0
for i in ${vec[*]}; do
    
    if [ $i -eq 1 ]; then
        let cant++
    fi
done

echo -e "${vec[@]}\n$cant"

