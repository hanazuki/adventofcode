lit = Array.new(1000) { Array.new(1000, false) }

$<.each_line do |l|
  case l.chomp
  when /turn (\w+) (\d+),(\d+) through (\d+),(\d+)/
    $2.to_i.upto($4.to_i) do |y|
      $3.to_i.upto($5.to_i) do |x|
        lit[y][x] = $1 == 'on'
      end
    end
  when /toggle (\d+),(\d+) through (\d+),(\d+)/
    $1.to_i.upto($3.to_i) do |y|
      $2.to_i.upto($4.to_i) do |x|
        lit[y][x] = !lit[y][x]
      end
    end
  end
end

puts lit.map {|a| a.count(true) }.inject(:+)
