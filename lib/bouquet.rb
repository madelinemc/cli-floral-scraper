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

    def self.print_all_bouquets
        Bouquet.all.each_with_index do |bouquet, index|
            if bouquet.name && bouquet.name != ""
                puts "#{index + 1}. #{bouquet.name}"
                puts "    #{bouquet.price}"
                puts " "
            end
        end
    end

    def print_selected_bouquet #prints the current instance of Bouquet
        puts "\n\n#{self.name}"
        puts "\nDescription: #{self.description}"
        puts "\nPrice: #{self.price}"
        puts "\nBundle includes:"
        puts self.detail_list.map { |detail| "- " + detail }
    end

    def self.find_by_index(user_input)

        self.all.each_with_index do |each_instance, index|
            if index == user_input.to_i - 1
                return each_instance
            else
            end
        end

        puts "I've never heard of that flower! Can you try entering again?"
    end
        

end
