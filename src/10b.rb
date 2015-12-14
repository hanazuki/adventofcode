def look_n_say(s)
  s.scan(/((.)\2*)/).map {|w, c|
    "#{w.length}#{c}"
  }.join
end

seq = $<.readline.chomp
50.times do
  seq = look_n_say(seq)
end
puts seq.length
