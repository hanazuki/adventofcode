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

$<.each_line do |l|
  if /Sue (?<sue>\d+): / =~ l
    known = $'.chomp.split(', ').map {|w|
      k, v = w.split(': ', 2)
      [k.intern, v.to_i]
    }.to_h

    if known <= facts
      puts sue
    end
  end
end
