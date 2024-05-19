from timeit import timeit

code = ""

values = [7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6]

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


algo_two_time = timeit(stmt=code, number=10000)

print ('Mode:', get_mode(values), f"\n Executed in: {algo_two_time}ms")
