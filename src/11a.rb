RE1 = Regexp.union(('a'..'x').map {|c| [c, c.succ, c.succ.succ].join })

def ok?(s)
  s =~ RE1 && s !~ /[iol]/ && s.scan(/(.)\1/).uniq.count >= 2
end

password = $<.readline.chomp
loop do
  password = password.succ
  break if ok?(password)
end

puts password
