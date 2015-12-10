puts $<.readlines.map(&:chomp).count {|w|
  w.scan(/[aeiou]/).count >= 3 && w =~ /([a-z])\1/ && w !~ /ab|cd|pq|xy/
}
