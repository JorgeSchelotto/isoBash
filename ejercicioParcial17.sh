#!/bin/bash


dir="$(getent passwd {1000..60000} | cut -d: -f6 )"
echo $dir
contiene="$(find $dir -maxdepth 1 -name "detect")"

if [ -z "$contiene" ]; then
    echo "1"
    exit 1
fi


echo "0"
exit 0

