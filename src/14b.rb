reindeer = $<.readlines.inject({}) {|h, l|
  if %r{(?<name>\w+) can fly (?<speed>\d+) km/s for (?<flying>\d+) seconds, but then must rest for (?<resting>\d+) seconds} =~ l
    h[name] = {speed: speed.to_i, flying: flying.to_i, resting: resting.to_i}
  end
  h
}

state = reindeer.map {|k, v| [k, {flying: true, time: v[:flying], points: 0, traveled: 0}] }.to_h

2503.times do |t|
  state.each do |k, v|
    while v[:time] == 0
      v[:flying] = !v[:flying]
      v[:time] = v[:flying] ? reindeer[k][:flying] : reindeer[k][:resting]
    end

    if v[:flying]
      v[:traveled] += reindeer[k][:speed]
    end

    v[:time] -= 1
  end

  max_traveled = state.map {|_, v| v[:traveled] }.max
  state.each do |_, v|
    v[:points] += 1 if v[:traveled] == max_traveled
  end
end

puts state.map {|_, v| v[:points] }.max
