require 'digest'

key = $<.readline.chomp
digest = Digest::MD5.new << key

n = 0
loop do
  hex = digest.dup.update(n.to_s).hexdigest
  break if hex.start_with?('0' * 6)
  n += 1
end
puts n
