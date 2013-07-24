require_relative 'player'
require_relative 'game'





player1 = Player.new("larry", 70)
#player1.doping
#puts player1.health

player2 = Player.new("shemp", 70)
#player2.vitamin

player3 = Player.new("moe", 70)




game1 = Game.new("D'n'd")
game1.load(ARGV.shift || "player.txt")

loop do
 puts "\nHow many actions? ('quit' to exit)"
 answer = gets.chomp.downcase
 case answer
 when /^\d+$/
  game1.play(answer.to_i)
 when 'quit', 'exit'
  game1.print_stats
  break
else
  puts "Please enter a number or 'quit'"
end
end

game1.save
