let numbers = [13, 5, 7, 200, 3, 7.9];

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