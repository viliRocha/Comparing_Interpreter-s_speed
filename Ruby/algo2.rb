require 'benchmark'

values = [7.9, 4.2, 7.9, 3.6, 0.9, 2.3, 3.6]

result = Benchmark.measure do

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
end

mode = get_mode(values)
puts    " \n Vals mode: #{mode}"

puts " \n Execution time: #{result.real} milliseconds"