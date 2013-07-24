module Dice
def self.roll_die
		rand(1..6)
	end

	def self.action(p)
       	number_rolled = roll_die
       	if number_rolled < 3
         p.doping
         puts "#{p.name} got doping"

        elsif number_rolled < 5
        	puts "#{p.name} was skipped"
        
        else
         p.vitamin
         puts "#{p.name} got vitamin"
    end
  end
end