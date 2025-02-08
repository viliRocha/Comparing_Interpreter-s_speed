from timeit import timeit

# Basic algorithm to put numbers from an array  in ascending order

# Lê o arquivo e processa os números
with open("test.txt", "r") as file:
    content = file.read()
    nums_array = (
        content.replace("[", "")  # Remove o colchete de abertura
               .replace("]", "")  # Remove o colchete de fechamento
               .split(",")        # Divide os números por vírgula
    )
    nums_array = [float(num.strip()) for num in nums_array]  # Remove espaços e converte para float

def get_mode(mod):
  frequency = {}

  bgst_freq = 1

  mode_vals = []

  for num in mod:

    if num in frequency:
      frequency[num] += 1
    else:
      frequency[num] = 1

    if (frequency[num] > bgst_freq):
      bgst_freq = frequency[num]

  for num in frequency:
    if(frequency[num] == bgst_freq):
      mode_vals.append(num)

  return mode_vals
    
code = '''
get_mode(nums_array)
'''


algo_two_time = timeit(stmt=code, number=1, globals=globals())

print ('Mode:', get_mode(nums_array), f"\n Executed in: {algo_two_time}ms")
