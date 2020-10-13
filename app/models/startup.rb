class Startup
    attr_reader :founder 
    attr_accessor :name, :domain 

    @@startups = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain
        @@startups << self  
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select {|round| round.startup ==  self}
    end

    def num_funding_rounds
        funding_rounds.count 
    end

    def total_funds
        sum = 0
        funding_rounds.each {|round| sum += round.investment }
        sum 
    end

    def investors
        investors = funding_rounds.map {|round| round.venture_capitalist }
        investors.uniq 
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end

    def self.all 
        @@startups
    end

    def self.find_by_founder(founder_name) 
        @@startups.find {|startup| startup.founder == founder_name}
    end

    def self.domains 
        @@startups.map {|startup| startup.domain }
    end

end
