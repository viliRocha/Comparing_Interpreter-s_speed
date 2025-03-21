import time

# Basic algorithm to put numbers from an array  in ascending order

# Measuring total time including the output
start_time = time.time()

# Read the file and process the numbers
with open("./data/250_nums.txt", "r") as file:
    content = file.read()
    nums_array = (
        content.replace("[", "")  # Remove the opening barcket
               .replace("]", "")
               .split(",")        # Split in the colon
    )
    nums_array = [float(num.strip()) for num in nums_array]  # Remove spaces and converts to float

def put_in_order(values):
  for i, num in enumerate(values):
    #current = num
    j = i - 1

    while j >= 0 and values[j] > num:
      values[j + 1] = values[j]
      j = j - 1

    values[j + 1] = num

mode_result = put_in_order(nums_array)
end_time = time.time()

total_time = (end_time - start_time) * 1000  # Convert to milliseconds

print(nums_array, f"\n Executed in: {total_time}ms")