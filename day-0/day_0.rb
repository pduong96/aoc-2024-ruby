def part_1(input = [''])
  input.length
end

def part_2(input = [''])
  input.length
end

# Test if implementation meets criteria from the description, swap out the expected value
test_file_path = File.expand_path('test.txt', File.dirname(__FILE__))
test_input = File.read(test_file_path).strip.lines(chomp: true)

raise 'Test failed' unless part_1(test_input) == 0

# raise "Test failed" unless part_2(test_input) == 0

# if solution works with the test input, run with the puzzle input
file_path = File.expand_path('input.txt', File.dirname(__FILE__))
input = File.read(file_path).strip.lines(chomp: true)
puts "Result for part 1: #{part_1(input)}"
# puts "Result for part 2: #{part_2(input)}"
