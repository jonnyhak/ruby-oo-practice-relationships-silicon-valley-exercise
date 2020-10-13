require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

snap = Startup.new("SnapChat", "Spiegel", "App")
microsoft = Startup.new("Microsoft", "Gates", "Software")
apple = Startup.new("Apple", "Jobs", "Hardware")
foundation = Startup.new("Foundation", "Gates", "Charity")

joe = VentureCapitalist.new("Joe", 2000000000)
igal = VentureCapitalist.new("Igal", 5000000000)
roman = VentureCapitalist.new("Roman", 1000)

round1 = FundingRound.new(snap, joe, "Seed", 5000)
round2 = FundingRound.new(microsoft, igal, "Angel", 8000)
round3 = FundingRound.new(apple, roman, "Series-A", 9000)
round4 = FundingRound.new(snap, igal, "Series-A", 4000)
round5 = FundingRound.new(microsoft, joe, "Angel", 3000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line