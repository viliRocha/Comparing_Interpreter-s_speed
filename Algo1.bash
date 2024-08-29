#!/bin/bash

# Define the numbers as a space-separated string
numbers="13, 5, 7, 200, 3, 7.9,"

# Function to sort numbers in increasing order using awk
put_in_order() {
    # Use awk to sort the numbers
    sorted_numbers=$(echo $numbers | awk '{for(i=1;i<=NF;i++) print $i}' | sort -n)
    # Convert the sorted output back into a variable
    numbers="$sorted_numbers"
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
