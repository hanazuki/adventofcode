$vals = {}
$procs = {}

def val(s)
  s =~ /\A\d+\z/ ? s.to_i : $procs[s].call
end

def make_proc(s)
  case s
  when /(?<in0>\w+) RSHIFT (?<in1>\w+) -> (?<out>\w+)/
    $procs[$~[:out]] = lambda do
      $vals[$~[:out]] ||= val($~[:in0]) >> val($~[:in1])
    end
  when /(?<in0>\w+) LSHIFT (?<in1>\w+) -> (?<out>\w+)/
    $procs[$~[:out]] = lambda do
      $vals[$~[:out]] ||= val($~[:in0]) << val($~[:in1])
    end
  when /(?<in0>\w+) AND (?<in1>\w+) -> (?<out>\w+)/
    $procs[$~[:out]] = lambda do
      $vals[$~[:out]] ||= val($~[:in0]) & val($~[:in1])
    end
  when /(?<in0>\w+) OR (?<in1>\w+) -> (?<out>\w+)/
    $procs[$~[:out]] = lambda do
      $vals[$~[:out]] ||= val($~[:in0]) | val($~[:in1])
    end
  when /NOT (?<in0>\w+) -> (?<out>\w+)/
    $procs[$~[:out]] = lambda do
      $vals[$~[:out]] ||= (2**16 - 1) - val($~[:in0])
    end
  when /(?<in0>\w+) -> (?<out>\w+)/
    $procs[$~[:out]] = lambda do
      $vals[$~[:out]] ||= val($~[:in0])
    end
  else
    fail l
  end
end

$<.each_line do |l|
  make_proc(l.chomp)
end

a = $procs['a'].call
$procs['b'] = lambda { a }
$vals.clear
puts $procs['a'].call
