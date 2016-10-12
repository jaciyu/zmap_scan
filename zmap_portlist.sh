#!/bin/bash
#author="JeeWin'

File="port.txt"
while read line
do
    ports=$ports' '${line}
done < ${File}

flag=0
for i in $ports
do
    if [ $flag -lt 10 ] # port number
    then
        echo "scaning $i"
        zmap -p $i  -f "saddr,sport" -o - -q -v 0 -B 10M 10.232.96.0/19 >>xt_output.txt
    fi
    ((flag++))
done

