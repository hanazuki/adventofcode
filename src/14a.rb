def travel(time, speed, flying, resting)
  n = time / (flying + resting)
  ([time - (flying + resting) * n, flying].min + flying * n) * speed
end

puts $<.readlines.map {|l|
  if %r{(?<name>\w+) can fly (?<speed>\d+) km/s for (?<flying>\d+) seconds, but then must rest for (?<resting>\d+) seconds} =~ l
    travel(2503, speed.to_i, flying.to_i, resting.to_i)
  end
}.max
