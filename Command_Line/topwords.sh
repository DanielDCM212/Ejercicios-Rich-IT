#!/bin/bash

link=$1
limit=$2

curl -s --compress $1 | tr '[:lower:]' '[:upper:]' | tr '[:space:]' '[\n*]' | sed 's/ //g' | sort| uniq -c | sort -n | tail -n $[$limit+1] | head -n $limit

