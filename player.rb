class Player
attr_accessor :name, :health


def initialize (name, health) 
	@name = name.capitalize
	@health = health
  @treasure_point = Hash.new(0)
end
# def heal
#     @health
# end
def to_txt
  "#{@name},#{@health}"
end
def self.from_txt(line)
  name, health = line.split(',')
  Player.new(name, Integer(health))
end
def each_treasure
  @treasure_point.each do |name, point|
  treasure = Treasure.new(name, point)
  yield treasure
  end
end
def point_consumed
  @treasure_point.values.reduce(0, :+) 
end
def used_treasure(treasure)
  @treasure_point [treasure.name] += treasure.point
  puts "#{@name} led to #{treasure.point} #{treasure.name} treasure being obtained."
  puts "#{@name}'s treasure: #{@treasure_point}"
end
def health?
	@health >= 80 
end
def status
	health? ? "Good" : "Bad"
#   if health?
#  	"good"
#    else
#	"bad"
#   end
end
def <=> (other_player)
  other_player.health <=> @health
end
def doping
	@health -= 15
	end
def vitamin
  @health += 20
end
def to_s
	"#{@name} has a health of #{@health} (#{status})"
 end
end

if __FILE__ == $0
#player1 = Player.new("larry", 60)
#player1.doping
#puts player1.health


#player2 = Player.new("shemp", 90)
#player2.vitamin
#puts player2

player3 = Player.new("moe", 100)
#puts player3
#puts player3.health
puts player3.to_s
end