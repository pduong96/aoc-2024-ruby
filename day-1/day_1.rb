def part_1(input = [''])
  first_list = []
  second_list = []
  input.each do |line|
    first, second = line.split('   ')
    first_list << first.to_i
    second_list << second.to_i
  end
  first_list.sort!
  second_list.sort!
  first_list.zip(second_list).sum { |first, second| (first - second).abs }
end

def part_2(input = [''])
  first_list = []
  second_list = []
  input.each do |line|
    first, second = line.split('   ')
    first_list << first.to_i
    second_list << second.to_i
  end

  second_list_group = second_list.group_by { |val| val}

  first_list.sum { |val| val * (second_list_group[val]&.length || 0)}
end

# Test if implementation meets criteria from the description, swap out the expected value
test_file_path = File.expand_path('test.txt', File.dirname(__FILE__))
test_input = File.read(test_file_path).strip.lines(chomp: true)
# raise 'Test failed' unless part_1(test_input) == 11

raise "Test failed" unless part_2(test_input) == 31

# if solution works with the test input, run with the puzzle input
file_path = File.expand_path('input.txt', File.dirname(__FILE__))
input = File.read(file_path).strip.lines(chomp: true)
# puts "Result for part 1: #{part_1(input)}"
puts "Result for part 2: #{part_2(input)}"
