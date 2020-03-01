#!/bin/bash

. EditTable.sh

printf "\nDatos preparados\n"

number=`cat UFO-Nov-Dic-2014.psv | wc -l`

printf "¿Cuántas observaciones totales? \n\t $number observaciones\n"

printf "¿Cuál es el top 5 de estados?\n`cat UFO-Nov-Dic-2014.psv | awk -F"|" '{print $3}' | sort | uniq -c | sort -n -r | head -n 5 | awk '{print $2}'`\n"

printf "¿Cuál es el top 5 de estados por año?\n"

printf "\tEs la misma respuesta que el la anterior pregunta todos los datos son del año 2014\n"

printf "¿Cuál es la racha más larga en días de avistamientos en un estado?\n"

printf "¿Cuál es el mes con más avistamientos?\n"

printf "\t`cat UFO-Nov-Dic-2014.psv | tail -n $(($number-1)) |awk -F"|" '{print $9}' | sort | uniq -c | sort -n -r  | head -n 1 | awk '{print $2}'` \n"

#bina=`cat UFO-Nov-Dic-2014.psv | awk -F"|" '{print $1}' | awk '{print $1}' | awk -F"/" '{print $1 }'| sort | uniq -c | head -n 1`

#printf "Observaciones `echo $bina | awk '{print $1}'`\n"

#printf "En el mes `echo $bina | awk '{print $2}'`\n"

printf "¿El día de la semana?\n"

printf "\t`cat UFO-Nov-Dic-2014.psv | tail -n $(($number-1)) |awk -F"|" '{print $8}' | sort | uniq -c | sort -n -r  | head -n 1 | awk '{print $2}'` \n"

