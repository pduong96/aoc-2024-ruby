def part_1(input = [''])
  running_total = 0

  input.each do |line|
    formulas = line.scan(/mul\((\d{1,3}),(\d{1,3})\)/)
    running_total += formulas.sum { |first, second| first.to_i * second.to_i }
  end

  running_total
end

def part_2(input = [''])
  running_total = 0
  is_do = true
  input.each do |line|
    formulas = line.scan(/(mul|do|don't)\((\d{1,3})?,?(\d{1,3})?\)/)
    formulas.each do |formula|
      function, first, second = formula
      case function
      when 'mul'
        if is_do && !first.nil? && !second.nil?
          running_total += first.to_i * second.to_i
        end
      when 'do'
        is_do = true
      when "don't"
        is_do = false
      end
    end
  end

  running_total
end

# Test if implementation meets criteria from the description, swap out the expected value
test_file_path = File.expand_path('test.txt', File.dirname(__FILE__))
test_input = File.read(test_file_path).strip.lines(chomp: true)
# raise 'Test failed' unless part_1(test_input) == 161

raise 'Test failed' unless part_2(test_input) == 48

# if solution works with the test input, run with the puzzle input
file_path = File.expand_path('input.txt', File.dirname(__FILE__))
input = File.read(file_path).strip.lines(chomp: true)
# puts "Result for part 1: #{part_1(input)}"
puts "Result for part 2: #{part_2(input)}"
