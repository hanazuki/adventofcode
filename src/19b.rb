require 'set'

def split(s)
  s.scan(/^e|[A-Z][a-z]*/)
end

def solve(map, target)
  minstep = 2**30

  100.times do
    tmp = target.dup
    step = 0

    loop do
      replaced = map.shuffle.map do |from, to|
        if tmp.include?(to)
          tmp.sub!(to, from)
          step += 1
        end
      end
      break if replaced.none?
    end

    minstep = step if tmp == ?e && step < minstep
  end

  minstep
end

map = []
$<.each_line do |l|
  if /(?<from>\w+) => (?<to>\w+)/ =~ l
    map << [from, to]
  elsif /\w+/ =~ l
    puts solve(map, l.chomp)
  end
end
