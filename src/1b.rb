floor = 0

$<.read.chomp.each_char.with_index(1) do |c, i|
  case c
  when '('
    floor += 1
  when ')'
    floor -= 1
  end

  if floor < 0
    puts i
    exit
  end
end
