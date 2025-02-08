from timeit import timeit

# Basic algorithm to put numbers from an array  in ascending order

# Read the file and process the numbers
with open("test.txt", "r") as file:
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

code = '''
put_in_order(nums_array)
'''

algo_one_time = timeit(stmt=code, number=1, globals=globals())

print(nums_array, f"\n Executed in: {algo_one_time}ms")