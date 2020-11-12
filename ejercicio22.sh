#!/bin/bash

num=(10 3 5 7 9 3 5 4)

for i in ${num[*]}; do
    for j in ${num[*]}; do
        
        res=$(($i*$j))
        echo $res
        
    done
done
