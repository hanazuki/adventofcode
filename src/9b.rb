require 'set'

$dist = Hash.new {|hash, key| hash[key] = Hash.new }
$cities = Set.new

$<.each_line do |l|
  /(?<a>\w+) to (?<b>\w+) = (?<d>\d+)/ =~ l
  $dist[a][b] = $dist[b][a] = d.to_i
  $cities << a << b
end

def dfs(cur, visited)
  visited = visited + [cur]
  return 0 if visited.size == $cities.size

  cost = -2**30
  ($cities - visited).each do |city|
    if $dist[cur][city]
      newcost = dfs(city, visited)
      if cost < newcost + $dist[cur][city]
        cost = newcost + $dist[cur][city]
      end
    end
  end
  cost
end

puts $cities.map {|city| dfs(city, []) }.max
