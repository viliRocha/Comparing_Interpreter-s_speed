import random

def generate_nums_with_repeats(amount, repeats):
    """
    Generates a list of random numbers with two decimal places, 
    ensuring that some numbers appear more than once.

    :param amount: Total number of values in the list.
    :param repeats: Number of values that must be repeated.
    :return: List of random numbers with repetitions.
    """
    unique_nums = []
    
    # Generates unique numbers with two decimal places
    for _ in range(amount - repeats):
        unique_nums.append(round(random.uniform(-10, 10), 2))
    
    # Choose some numbers to be repeated
    repeated_nums = random.choices(unique_nums, k=repeats)
    
    # Combines unique numbers with repeated ones
    all_nums = unique_nums + repeated_nums
    
    # Shuffle the list to mix up the numbers
    random.shuffle(all_nums)
    
    return all_nums

print(generate_nums_with_repeats(12, 4))