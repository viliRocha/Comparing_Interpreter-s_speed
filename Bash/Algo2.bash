#!/bin/bash

values=(7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6)

get_mode() {
    # Converting the array to a string and passing it to AWK
    vals_mode=$(printf "%s\n" $values | awk '
    {
        # Cut the frequency of each number
        for (i = 1; i <= NF; i++) {
            freq[$i]++;
            if (freq[$i] > max_freq) {
                max_freq = freq[$i];
            }
        }
    }

    END {
        # Find the numbers that have the highest frequency
        for (num in freq) {
            if (freq[num] == max_freq) {
                modes[count++] = num;
            }
        }
    
        # Print the results
        printf "Mode: ";
        for (i = 0; i < count; i++) {
            printf "%s%s", modes[i], (i < count - 1 ? ", " : "");
        }
        print "";
    }
    ')
}

# Mesure execution time
start=$(date +%s%3N)
get_mode
end=$(date +%s%3N)
runtime=$((end - start))    # execution time in milliseconds

echo "Code executed in: $runtime ms"