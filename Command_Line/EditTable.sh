#!/bin/bash

number=`wc -l data/UFO-Dic-2014.tsv | awk '{print $1}'`

cat data/UFO-Dic-2014.tsv |tr ["\t"] ["|"] |tail -n $number > UFO-Dic-2014.tsv

cat data/UFO-Nov-2014.tsv |tr ["\t"] ["|"] > UFO-Nov-2014.tsv

cat UFO-Nov-2014.tsv UFO-Dic-2014.tsv > UFO-Nov-Dic-2014_1.psv

function ObtainData(){
	DataDay=`date -d "$date"`
	echo $DataDay
}

input="UFO-Nov-Dic-2014_1.psv"

i=0

while IFS= read -r line
do

if [ $i = "0" ]; then

printf "$line|day|month" >> UFO-Nov-Dic-2014.psv

else
date=`echo $line | awk -F"|" '{print $1}' | awk '{print $1}'`
month=`echo $(ObtainData) | awk '{print $1}'`
day=`echo $(ObtainData) | awk '{print $2}'`
printf "\n$line|$month|$day" >> UFO-Nov-Dic-2014.psv
fi

i=$(($i+1))

done < "$input"


