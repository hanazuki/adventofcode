puts $<.read.chomp.each_char.map {|c|
  case c
  when '('
    +1
  when ')'
    -1
  end
}.inject(:+)
