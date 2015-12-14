require 'json'

def sum(o)
  case o
  when Numeric
    o
  when Array
    o.map {|v| sum(v) }.inject(:+)
  when Hash
    if o.values.include?('red')
      0
    else
      sum(o.values)
    end
  when String
    0
  else
    fail o.class.name
  end
end

puts sum(JSON.parse($<.read))
