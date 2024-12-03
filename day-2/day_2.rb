def part_1(input = [''])
  input.select do |line|
    sequence = line.split(' ').map { |it| it.to_i }
    results = sequence
              .each_cons(2)
              .map { |pair| pair[0] - pair[1] }
    results.all? { |num| num.positive? && num <= 3 } || results.all? { |num| num.negative? && num >= -3 }
  end.size
end

def results_valid?(results)
  results.all? { |num| num.positive? && num <= 3 } || results.all? { |num| num.negative? && num >= -3 }
end

def part_2(input = [''])
  valid_list = input.select do |line|
    sequence = line.split(' ').map { |it| it.to_i }
    results = sequence
              .each_cons(2)
              .map { |pair| pair[0] - pair[1] }
    valid = results_valid?(results)
    unless valid
      has_one_valid = false
      i = 0
      while i < sequence.size && !has_one_valid do
        list_without_one_element = sequence.clone
        list_without_one_element.delete_at(i)
        new_results = list_without_one_element.each_cons(2).map { |pair| pair[0] - pair[1] }
        if results_valid? new_results
          has_one_valid = true
        end
        i += 1
      end
      valid = has_one_valid
    end
    valid

  end
  valid_list.size
end

# Test if implementation meets criteria from the description, swap out the expected value
test_file_path = File.expand_path('test.txt', File.dirname(__FILE__))
test_input = File.read(test_file_path).strip.lines(chomp: true)
# raise 'Test failed' unless part_1(test_input) == 2

raise 'Test failed' unless part_2(test_input) == 4

# if solution works with the test input, run with the puzzle input
file_path = File.expand_path('input.txt', File.dirname(__FILE__))
input = File.read(file_path).strip.lines(chomp: true)
# puts "Result for part 1: #{part_1(input)}"
puts "Result for part 2: #{part_2(input)}"
