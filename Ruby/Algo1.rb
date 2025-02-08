require 'benchmark'

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

#   Calculate programs execution time
result = Benchmark.measure do
  numsArray = []

  File.open("./data/50_nums.txt", "r") do |file|
    content = file.read
    numsArray = content
                  .gsub("[", "") # Remove the opening barcket
                  .gsub("]", "")
                  .split(",")
                  .map { |num| num.strip.to_f } # Removes spaces and converts to float
  end

    put_in_order(numsArray)
    print(numsArray)
end

puts " \n Execution time: #{result.real} milliseconds"