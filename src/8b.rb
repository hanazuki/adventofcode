puts $<.each_line.map {|l|
  l.chomp!
  l.inspect.length - l.length
}.inject(:+)
