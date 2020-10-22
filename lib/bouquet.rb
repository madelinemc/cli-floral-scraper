class Bouquet
   attr_accessor :name, :price, :link, :description, :detail_list

    @@all = []

    def initialize
        @name = name
        @price = price
        @link = link
        @description = description
        @detail_list = []
        @@all << self
    end

    def self.all
        @@all
    end
end
