require 'prime'

w = $<.readline.chomp.to_i / 10

n = 1
loop do
  s = Prime.prime_division(n).inject(1) {|a, (p, e)| a * (0..e).inject(0) {|a, i| a + p ** i } }
  break if w <= s
  n += 1
end

puts n
