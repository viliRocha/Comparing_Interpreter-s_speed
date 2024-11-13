from timeit import timeit

# Basic algorithm to put numbers from an array  in ascending order

numbers = [13, 5, 7, 200, 3, 7.9]

def put_in_order():
  for i, num in enumerate(numbers):
    #current = num
    j = i - 1

    while j >= 0 and numbers[j] > num:
      numbers[j + 1] = numbers[j]
      j = j - 1

    numbers[j + 1] = num

code = '''
put_in_order()
'''

algo_one_time = timeit(stmt=code, number=1, globals=globals())

print(numbers, f"Executed in: {algo_one_time}ms")
