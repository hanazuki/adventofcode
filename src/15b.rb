m = $<.each_line.map {|l|
  if /capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)/ =~ l
    $~.to_a[1..-1].map(&:to_i)
  end
}

max = 0
0.upto(100) do |i|
  0.upto(100 - i) do |j|
    0.upto(100 - i - j) do |k|
      l = 100 - i - j - k

      s = [i, j, k, l].zip(m).map {|q, row| row.map {|c| c * q } }.transpose.map {|col| [col.inject(:+), 0].max }
      if s.pop == 500
        max = [s.inject(:*), max].max
      end
    end
  end
end

puts max
