module Ausburbs
  class State
    attr_accessor :name, :suburbs, :capital

    def initialize(*args)
      self.name = args[0]
      load_suburb_data!(args[1])
      
      case self.name        
      when "NSW"
        self.capital = "Sydney"
      when "VIC"
        self.capital =  'Melbourne'
      when "ACT"
        self.capital =  'Canberra'
      when "QLD"
        self.capital =  'Brisbane'
      when "TAS"
        self.capital =  'Hobart'
      when "WA"
        self.capital =  'Perth'
      when "SA"
        self.capital =  'Adelaide'
      when "NT"
        self.capital =  'Darwin'
      end
    end

    private
    def load_suburb_data!(data)
      self.suburbs = []
      data.each do |suburb_data|
        self.suburbs << Suburb.new(suburb_data)
      end
      self.suburbs.sort{ |s1, s2| s1.postcode <=> s2.postcode }
    end
  end
end
