require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './bouquet.rb'

class FloralScraper

    def get_page
        url = "https://www.hbloom.com/collections/florist-crafted-bouquets" 
        html = open(url)
        flower_bouquets = Nokogiri::HTML(html)
    end

    def get_bouquets
        self.get_page.css(".grid__item")
       
  
    end

    def make_bouquets
        self.get_bouquets.each do |bouquet_item|
            bouquet = Bouquet.new
            bouquet.name = bouquet_item.css(".h4").text
            bouquet.price = bouquet_item.css(".price-item.price-item--regular").text.strip
        end
    end

    def print_bouquets
        self.make_bouquets
        Bouquet.all.each do |bouquet|
            if bouquet.name && bouquet.name != ""
                puts "Bouquet Name: #{bouquet.name}"
                puts "Price: #{bouquet.price}"
                puts " "
            end
        end
    end
    
end

FloralScraper.new.print_bouquets
