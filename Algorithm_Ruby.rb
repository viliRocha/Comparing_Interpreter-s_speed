require 'benchmark'

numbers = [13, 5, 7, 200, 3, 7.9]

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
