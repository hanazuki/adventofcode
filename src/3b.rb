require 'set'

origin = [0, 0]
players = [origin, origin]
visited = Set.new << origin

$<.read.each_char.with_index do |c, i|
  player = i % 2
  y, x = players[player]
  case c
  when '^'; y -= 1
  when 'v'; y += 1
  when '<'; x -= 1
  when '>'; x += 1
  end
  visited << (players[player] = [y, x])
end

puts visited.size
