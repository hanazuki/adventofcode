require 'prime'

def divisor(n, &block)
  def iter(w, i, pd, &block)
    return block.call(w) if i == pd.size

    p, e = pd[i]
    0.upto(e) do |r|
      iter(w * (p ** r), i + 1, pd, &block)
    end
  end

  iter(1, 0, Prime.prime_division(n), &block)
end

w = $<.readline.chomp.to_i / 11

n = 1
loop do
  s = 0
  divisor(n) do |d|
    s += d if n <= d * 50
  end

  break if w <= s
  n += 1
end

puts n
