caps = $<.readlines.map {|s| s.chomp.to_i }.sort_by(&:-@)

def dfs(caps, rest)
  return rest == 0 ? 1 : 0  if caps.empty?

  cap = caps[0]
  caps = caps[1..-1]

  [0, 1].map {|n|
    dfs(caps, rest - cap * n)
  }.inject(:+)
end

puts dfs(caps, 150)
