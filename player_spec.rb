require_relative 'player'

describe Player do
    before do
    @player = Player.new("larry", 90)
    end

    it "has a capitalized title" do
    
    @player.name.should == "Larry"
end
    
   it "has a initial healht" do 

    @player.health.should == 90
end

    it "has a string representation" do
     
     @player.to_s.should == "Larry has a health of 90 (Good)"
     end
    it "increases health by 20 when eating a vitamin" do

     @player.vitamin.should == 110
    end
    it "decreases health by 15 when eating a doping" do

     @player.doping.should == 75
    end

    context "with a health less then 80" do
    	before do
        @player = Player.new("larry", 60)
    end
    it "it's bad health" do
    	@player.should_not be_health 
    end
    it "has a bad status" do
    	@player.status.should == "Bad"
    end
  end
    
    context "with a health more then 80" do
    	before do
        @player = Player.new("larry", 85)
    end
    it "it's good health" do
    	@player.health?.should == true
    end
    it "has a good status" do
    	@player.status.should == "Good"
    end
   end
end