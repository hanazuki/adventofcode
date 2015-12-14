puts $<.each_line.map {|l|
  xyz = l.chomp.split('x').map(&:to_i)
  xyz.sort[0, 2].inject(:+) * 2 + xyz.inject(:*)
}.inject(:+)
