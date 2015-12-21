items = DATA.read.scan(/(\w+):.*?\n([^:]*)(?:\n\n|\Z)/m).map {|category, list|
  list = list.split(?\n).map{|l|
    name, cost, damage, armor = l.split(/\s{2,}/)
    {name: name, cost: cost.to_i, damage: damage.to_i, armor: armor.to_i}
  }
  [category.intern, list]
}.to_h

enemy_hp, enemy_damage, enemy_armor = $<.read.split(?\n).map {|l| l.split(': ', 2)[1].to_i }

def kiriage(x, y)
  (x + y - 1) / y
end

def simulate(my_hp, my_damage, my_armor, enemy_hp, enemy_damage, enemy_armor)
  turns_to_lose = kiriage(my_hp, [enemy_damage - my_armor, 1].max)
  turns_to_win = kiriage(enemy_hp, [my_damage - enemy_armor, 1].max)

  if turns_to_win <= turns_to_lose
    :win
  else
    :lose
  end
end

constraint = {Weapons: 1..1, Armor: 0..1, Rings: 0..2}

min_cost = 2**30

(1..1).each do |nw|
  items[:Weapons].combination(nw) do |weapons|
    (0..1).each do |na|
      items[:Armor].combination(na) do |armor|
        (0..2).each do |nr|
          items[:Rings].combination(nr) do |rings|
            purchase = weapons + armor + rings
            cost, my_damage, my_armor = purchase.inject([0, 0, 0]) do |(cost, damage, armor), i|
              [cost + i[:cost], damage + i[:damage], armor + i[:armor]]
            end

            if simulate(100, my_damage, my_armor, enemy_hp, enemy_damage, enemy_armor) == :win
              min_cost = [cost, min_cost].min
            end
          end
        end
      end
    end
  end
end

p min_cost

__END__
Weapons:    Cost  Damage  Armor
Dagger        8     4       0
Shortsword   10     5       0
Warhammer    25     6       0
Longsword    40     7       0
Greataxe     74     8       0

Armor:      Cost  Damage  Armor
Leather      13     0       1
Chainmail    31     0       2
Splintmail   53     0       3
Bandedmail   75     0       4
Platemail   102     0       5

Rings:      Cost  Damage  Armor
Damage +1    25     1       0
Damage +2    50     2       0
Damage +3   100     3       0
Defense +1   20     0       1
Defense +2   40     0       2
Defense +3   80     0       3
