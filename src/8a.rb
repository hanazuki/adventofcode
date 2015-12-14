puts $<.each_line.map {|l|
  l.chomp!
  l.length - eval(l).length
}.inject(:+)
