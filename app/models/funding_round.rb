class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@funding_rounds = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type 
        @investment = investment
        @@funding_rounds << self 
    end

    def self.all 
        @@funding_rounds
    end

end
