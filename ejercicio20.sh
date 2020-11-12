#!/bin/bash

# Script para simular una pila



inicializar(){
    pila=()
}

push(){
    # function push{}
    #
    if [ $# -ne 1 ]; then
        
        echo 'Nop, se necesita un parametro'
        return 1
    fi
    
    pila=(${pila[*]} $1)
    return 0
}

lenght(){
    echo "${#pila[*]}"
    return 0
}

print(){
    
    echo ${pila[@]}
    
}

pop(){
    posFinal=$((${#pila[*]} - 1))
    
    unset pila[$posFinal]
    pila=(${pila[*]})
    return 1
}



opt=("inicializar" "push" "lenght" "print" "pop" "terminar")
select option in "${opt[@]}"; do
    case $option in
        "inicializar")
            inicializar
        ;;
        "push")
            echo "Ingrese valor a agregar: "
            read var
            push $var
        ;;
        "lenght")
            lenght
        ;;
        "print")
            print
        ;;
        "pop")
            pop
        ;;
        "terminar")
            exit 0
        ;;
        *)
            echo "option: $option"
            echo "Nop $REPLY"
        ;;
    esac
done

exit 0


