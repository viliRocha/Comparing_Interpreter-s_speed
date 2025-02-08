require 'benchmark'

def get_mode(mod)
    frequency = {}

    bgst_freq = 1

    mode_vals = []

    for i in 0...mod.length 
        num = mod[i]

        if frequency[num]
            frequency[num] += 1
        else 
            frequency[num] = 1
        end

        if frequency[num] > bgst_freq
            bgst_freq = frequency[num]
        end
    end

    frequency.each do |num, freq|
        if freq == bgst_freq
            mode_vals.push(num)
        end
    end

    return mode_vals
end

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

    puts    " \n Vals mode: #{get_mode(numsArray)}"
end

puts " \n Execution time: #{result.real} milliseconds"