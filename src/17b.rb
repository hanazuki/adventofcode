caps = $<.readlines.map {|s| s.chomp.to_i }.sort_by(&:-@)

$comb = []

def dfs(i, caps, rest, used)
  if i == caps.size
    if rest == 0
      $comb << used
    end
    return
  end

  return if rest < 0

  dfs(i + 1, caps, rest - caps[i], used + [i])
  dfs(i + 1, caps, rest, used)
end

dfs(0, caps, 150, [])

minnum = $comb.map(&:size).min
puts $comb.count {|c| c.size == minnum && $comb.any? {|d| (c & d).empty? } }
