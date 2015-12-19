require 'set'

def solve(map, l)
  set = Set.new

  map.each do |from, tos|
    l.scan(/#{from}/) do
      tos.each do |to|
        set << "#{$`}#{to}#{$'}"
      end
    end
  end

  puts set.size
end

map = Hash.new {|h, k| h[k] = [] }
$<.each_line do |l|
  if /(?<from>\w+) => (?<to>\w+)/ =~ l
    map[from] << to
  elsif /\w+/ =~ l
    solve(map, l.chomp)
  end
end
