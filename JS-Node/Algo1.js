let numbers = [-3.5, 2, 0, -1, 4.2, 7, -8, 5.5, 3, -2, 1.1, 6, -4, 8.8, 0.5, -6];

function put_in_order() {
  console.time('code executed in');
        
  for (let i = 1; i < numbers.length; i++) {
    let current = numbers[i];
    let j = i - 1;
        
    while (j >= 0 && numbers[j] > current) {
      numbers[j + 1] = numbers[j];
      j--;
    }
        
    numbers[j + 1] = current;
  }
  console.timeEnd('code executed in');
}

put_in_order()
console.log(numbers);