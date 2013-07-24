require_relative 'game'

describe Game do
	
	before do
		@game = Game.new("DnD")
end
  

  context "being played with one player" do
  	before do
  		@initial_health = 100
        @player = Player.new("Moe", @initial_health)
        @game.add_player(@player)
    end

    it "gives player vitamin if high number is rolled" do
    	Dice.stub(:roll_die).and_return(5)
    	@game.play

    	@player.health.should == @initial_health + 20
  	end

  	it "gives nothing if medium number is rolled" do
        Dice.stub(:roll_die).and_return(3)
  		@game.play

  		@player.health.should == @initial_health
  	end
     
     it "gives player doping if low number is rolled" do
        Dice.stub(:roll_die).and_return(1)
     	@game.play

     	@player.health.should == @initial_health - 15
     end
    end
  end

