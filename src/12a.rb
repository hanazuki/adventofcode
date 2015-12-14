puts $<.read.scan(/-?\d+/).map(&:to_i).inject(:+)
