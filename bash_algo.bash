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

time put_in_order #Mesures execution time(just shows 3 decimals)

# Also mesures execution time, but I can customize how many decimals I want
start=$(date +%s.%N)
put_in_order
end=$(date +%s.%N)
# Shows the execution time with 20 decimals
runtime=$(printf "%.20f" $(echo "$end - $start" | bc))

# shows ordenated numbers
echo "${numbers[@]}"

echo "Code executed in: $runtime seconds"
