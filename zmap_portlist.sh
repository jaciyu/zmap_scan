#!/bin/bash
File="port.txt"

while read line
do
    ports=$ports' '${line}
done < ${File}

#ports="80 81 82 443 7001 7011 8011 8080 8081 2375 6379 11211"

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

