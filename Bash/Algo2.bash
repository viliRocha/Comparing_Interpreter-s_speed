#!/bin/bash

# Read the file contents
content=$(<./data/1000_nums.txt)

# Remove brackets and commas (need to be a space-separated string for AWK)
clean_content=$(echo "$content" | sed 's/[][]//g' | tr -d ',')

get_mode() {
    # Converting the array to a string and passing it to AWK
    vals_mode=$(printf "%s\n" "${clean_content[@]}" | awk '
    {
        # Cut the frequency of each number
        for (i = 1; i <= NF; i++) {
            freq[$i]++;
            if (freq[$i] > bgst_freq) {
                bgst_freq = freq[$i];
            }
        }
    }

    END {
        # Find the numbers that have the highest frequency
        for (num in freq) {
            if (freq[num] == bgst_freq) {
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

printf "%s\n" "${vals_mode[@]}"

echo "Code executed in: $runtime ms"