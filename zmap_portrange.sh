#!/bin/bash
start=1
end=65535+1
for ((i=$start;i<$end;i++))
do
    echo "scaning $i,$[i-start+1]/$[end -start]"
    zmap -p $i  -f "saddr,sport" -o - -q -v 0 -B 30M 10.223.0.0/18 >>output.txt
done
