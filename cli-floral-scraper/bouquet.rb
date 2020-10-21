class Bouquet
   attr_accessor :name, :price

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end
