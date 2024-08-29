#!/bin/bash

# Array of floating-point numbers
numbers=(13, 5, 7, 200, 3, 7.9)

# Function to sort numbers in increasing order using awk
put_in_order() {
    # Convert the array to a format suitable for awk
    printf "%s\n" "${numbers[@]}" | awk '{a[NR] = $0} END {for (i = 1; i <= NR; i++) for (j = i + 1; j <= NR; j++) if (a[i] > a[j]) {temp = a[i]; a[i] = a[j]; a[j] = temp} for (i = 1; i <= NR; i++) print a[i]}'
}

#Mesures execution time in seconds
#time put_in_order

# Mesure execution time
start=$(date +%s%3N)
put_in_order
end=$(date +%s%3N)
runtime=$((end - start))    # execution time in milliseconds

# Show ordered numbers
echo "Ordered numbers: ${sorted_numbers[@]}"

# Exhibit execution time
echo "Code executed in: $runtime milliseconds"
