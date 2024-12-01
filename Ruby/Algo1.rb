require 'benchmark'

numbers = [-3.5, 2, 0, -1, 4.2, 7, -8, 5.5, 3, -2, 1.1, 6, -4, 8.8, 0.5, -6]

#Calculate programs execution time
result = Benchmark.measure do
    def put_in_order(numbers)
        for i in 1...numbers.length
            j = i - 1
            num = numbers[i]
    
            while j >= 0 and numbers[j] > num
            numbers[j + 1] = numbers[j]
            j = j - 1
            end
    
            numbers[j + 1] = num
        end
    end
end

put_in_order(numbers)
print(numbers)

puts " \n Execution time: #{result.real} milliseconds"