state = $<.readlines.each(&:chomp!)

HW = 100

def l(state, i, j)
  return false if i < 0 || j < 0 || i >= HW || j >= HW
  state[i][j] == '#'
end

NEIBOURHOOD = [-1, 0, 1].product([-1, 0, 1]).tap{|a| a.delete([0, 0]) }

def step(state)
  new_state = Array.new(HW) { '#' * HW }

  HW.times do |i|
    HW.times do |j|
      c = NEIBOURHOOD.count {|di, dj| l(state, i + di, j + dj) }
      if l(state, i, j)
        new_state[i][j] = c == 2 || c == 3 ? '#' : '.'
      else
        new_state[i][j] = c == 3 ? '#' : '.'
      end
    end
  end

  new_state
end

100.times do
  state = step(state)
end

puts state.map {|s| s.count('#') }.inject(:+)
