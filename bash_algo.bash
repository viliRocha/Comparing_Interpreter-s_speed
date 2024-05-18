#!/bin/bash

#Unfortunatelly it is hard to support float numbers

numbers=(13 5 7 200 3 9)

put_in_order() {
    for ((i=1; i<7; i++)); do
        num=${numbers[i]}
        j=$((i-1))
        while ((j>=0 && numbers[j]>num)); do
            numbers[j+1]=${numbers[j]}
            j=$((j-1))
        done
        numbers[j+1]=$num
    done
}

#Mesures execution time
time put_in_order

# shows ordenated numbers
echo "${numbers[@]}"
