def score(order, m)
  0.upto(order.size - 1).map {|i|
    j = (i + 1) % order.size
    m[order[i]][order[j]] + m[order[j]][order[i]]
  }.inject(:+)
end

m = Hash.new {|hash, key| hash[key] = Hash.new(0) }

$<.each_line do |l|
  if /^(?<a>\w+) would (?<pm>lose|gain) (?<point>\d+) happiness units by sitting next to (?<b>\w+)./ =~ l
    m[a][b] = point.to_i * (pm == 'gain' ? 1 : -1)
  end
end

names = m.keys

head = names[0]
tail = names[1..-1]

puts tail.permutation.collect {|perm|
  perm.push(head)

  score(perm, m)
}.max
