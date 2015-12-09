require 'set'

y = 0
x = 0

visited = Set.new << [y, x]

$<.read.chomp.each_char do |c|
  case c
  when '^'; y -= 1
  when 'v'; y += 1
  when '<'; x -= 1
  when '>'; x += 1
  end
  visited << [y, x]
end

puts visited.size
