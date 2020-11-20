#comprobar los parametros
if [ $# -ne 2 ]; then
    echo "INVALID PARAMETERS"
    exit 1
fi
cant=0
vec=()
while IFS=, read pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10; do
   if [ "$pos2" = "$1" ] && [ "$pos5" = "$2" ]; then
     vec=(${vec[*]} $pos3) 
    let cant=$cant+$pos9
    fi
done < "100_Sales_Records.csv"
if [ ${#vec[@]} -ge 1 ]; then
  for i in ${vec[*]}; do
    echo $i
  done
  echo $cant 
  exit 0
else
    exit 2
fi    
