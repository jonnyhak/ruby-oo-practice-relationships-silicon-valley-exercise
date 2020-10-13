class VentureCapitalist
    attr_accessor :name, :total_worth

    @@venture_capitalists = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@venture_capitalists << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select {|round| round.venture_capitalist ==  self}
    end

    def portfolio
        portfolio = funding_rounds.map {|round| round.startup }
        portfolio.uniq 
    end

    def biggest_investment 
        max = 0
        funding_round = nil
        funding_rounds.each do |round|
            if round.investment > max 
                max = round.investment
                funding_round = round 
            end
        end
        funding_round
    end

    def invested(domain_str) 
        total = 0
        funding_rounds.each do |round|
            if round.startup.domain == domain_str
                total += round.investment 
            end
        end
        total 
    end

    def self.all 
        @@venture_capitalists
    end

    def self.tres_commas_club 
        @@venture_capitalists.select {|vc| vc.total_worth > 1000000000 }
    end

    #NoMethodError ^

end
