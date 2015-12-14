puts $<.readlines.map(&:chomp).count {|w|
  w =~ /(..).*\1/ && w =~ /(.).\1/
}
