import time

# Measuring total time including the output
start_time = time.time()

# Read the file and process the numbers
with open("./data/1000_nums.txt", "r") as file:
    content = file.read()
    nums_array = (
        content.replace("[", "")  # Remove the opening bracket
               .replace("]", "")  # Remove the closing bracket
               .split(",")        # Split the numbers by comma
    )
    nums_array = [float(num.strip()) for num in nums_array]  # Remove spaces and convert to float

def get_mode(mod):
    frequency = {}
    bgst_freq = 1
    mode_vals = []

    for num in mod:
        if num in frequency:
            frequency[num] += 1
        else:
            frequency[num] = 1

        if frequency[num] > bgst_freq:
            bgst_freq = frequency[num]

    for num in frequency:
        if frequency[num] == bgst_freq:
            mode_vals.append(num)

    return mode_vals

mode_result = get_mode(nums_array)
end_time = time.time()

total_time = (end_time - start_time) * 1000  # Convert to milliseconds

print('Mode:', mode_result, f"\n Executed in: {total_time:.4f} ms")
