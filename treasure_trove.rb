Treasure = Struct.new(:name, :point)

module TreasureTrove
TREASURE = [ 
  Treasure.new(:sword, 35),
  Treasure.new(:shield, 24),
  Treasure.new(:bottle, 15),
  Treasure.new(:armour, 40)
]
def self.random
  TREASURE.sample 
  end
end

if __FILE__ == $0
puts TreasureTrove::TREASURE
treasure = TreasureTrove.random
puts "Enjoy your #{treasure.name} (#{treasure.point} point)"
end