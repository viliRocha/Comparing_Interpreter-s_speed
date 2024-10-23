#!/bin/bash

# Define the numbers as a space-separated string
numbers="13 5 7 200 3 7.9"

# Function to sort numbers in increasing order using awk
put_in_order() {
    # Converting the array to a format suitable for awk
    
    # Using awk "sort" 
    # sorted_numbers=$(echo $numbers | awk '{for(i=1;i<=NF;i++) print $i}' | sort -n)

    # without awk sort (Adding + 0 in if (a[i] + 0 > a[j] + 0) forces awk to treat them as floats)
    sorted_numbers=$(printf "%s\n" $numbers | awk '{a[NR] = $0} END {for (i = 1; i <= NR; i++) for (j = i + 1; j <= NR; j++) if (a[i] + 0 > a[j] + 0) {temp = a[i]; a[i] = a[j]; a[j] = temp} for (i = 1; i <= NR; i++) print a[i]}')
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