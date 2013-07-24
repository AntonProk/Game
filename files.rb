require_relative 'player'

player1 = Player.new("anton", 80)
player2 = Player.new("alex", 80)
player3 = Player.new("andrew", 80)

player = [player1, player2, player3]

  File.open("player_health.txt", "w") do |file|
    player.sort.each do |player|
      file.puts "#{player.name},#{player.health}"
  end
end
