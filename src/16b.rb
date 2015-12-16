facts = {
  children: 3,
  cats: 7,
  samoyeds: 2,
  pomeranians: 3,
  akitas: 0,
  vizslas: 0,
  goldfish: 5,
  trees: 3,
  cars: 2,
  perfumes: 1,
}

incorrect_facts = [:cats, :trees, :pomeranians, :goldfish].map {|k|
  [k, facts.delete(k)]
}.to_h

$<.each_line do |l|
  if /Sue (?<sue>\d+): / =~ l
    known = $'.chomp.split(', ').map {|w|
      k, v = w.split(': ', 2)
      [k.intern, v.to_i]
    }.to_h

    u__n = [:cats, :trees, :pomeranians, :goldfish].map {|k|
      [k, known.delete(k)]
    }.to_h

    if known <= facts &&
       (!u__n[:cats] || u__n[:cats] > incorrect_facts[:cats]) &&
       (!u__n[:trees] || u__n[:trees] > incorrect_facts[:trees]) &&
       (!u__n[:pomeranians] || u__n[:pomeranians] < incorrect_facts[:pomeranians]) &&
       (!u__n[:goldfish] || u__n[:goldfish] < incorrect_facts[:goldfish])
      puts sue
    end
  end
end
