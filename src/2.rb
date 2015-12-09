puts $<.each_line.map {|l|
  l, w, h = l.chomp.split('x').map(&:to_i)
  2*l*w + 2*w*h + 2*h*l + [l*w, w*h, h*l].min
}.inject(:+)
