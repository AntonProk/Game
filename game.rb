require_relative 'player'
require_relative 'dice'
require_relative 'treasure_trove'

class Game
	def initialize (name)
		@name= name
		@players = []
end
def load(from_file)
  File.readlines(from_file).each do |line|
    add_player(Player.from_txt(line))
  end
end
def save(to_file="player_health.txt")
File.open(to_file, "w") do |file|
    @players.sort.each do |player|
      file.puts player.to_txt
  end
end

end
	def add_player (player)
        @players << player
end
	#def count (action)
   # 1.upto(action) do |count|
    #  puts "\nAction #{count}"
#end
	def play (actions)
    puts "#{@name} game:"
      puts @players.sort

        treasure = TreasureTrove::TREASURE 
        puts "\nThere are #{treasure.size} treasure available in the treasure trove."
        treasure.each do |treasure|
          puts "#{treasure.name} has #{treasure.point}"
        end

        1.upto(actions) do |count|
          puts "\nAction #{count}"
            @players.each do |p|
              Dice.action(p)
              treasure = TreasureTrove.random
                p.used_treasure(treasure)
                  puts p
    end
  end
end
 

def total_point_consumed
    @players.reduce(0) do |sum, player|
     sum + player.point_consumed
 end
end

  def print_stats
    puts "\n#{@name}'s Stats:"
    
    puts "#{total_point_consumed} total point consumed"

    @players.sort.each do |player|
      puts "\n#{player.name}'s point total:"
      player.each_treasure do |treasure|
      puts "#{treasure.point} total #{treasure.name} point"
end

      puts "#{player.point_consumed} grand total points"
end     
    vitamins, dopings = @players.partition {|player| player.health? }
    
    puts "\nVitamins:"
    puts vitamins.sort


    puts "\nDoping:"
    puts dopings.sort

    end
  end
