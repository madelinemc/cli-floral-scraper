class Bouquet
   attr_accessor :name, :price, :link

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end
