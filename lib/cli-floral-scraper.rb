require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './bouquet.rb'
require_relative './cli.rb'

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
            bouquet.link = bouquet_item.css("a.grid-view-item__link").attr('href')
        end
    end

    def print_bouquets
        self.make_bouquets
        Bouquet.all.each_with_index do |bouquet, index|
            if bouquet.name && bouquet.name != ""
                puts "#{index + 1}. #{bouquet.name}"
                puts "    #{bouquet.price}"
                puts " "
            end
        end
    end

    def get_bouquet_info_page #second scrape
        Bouquet.each |bouquet|
        second_url = "https://www.hbloom.com#{bouquet.link}"
        second_scrape = Nokogiri::HTML(open(second_url))
    end

    def add_bouquet_info #adds description and detail list from second scrape to each Bouquet instance. !is .map right?
        self.get_bouquet_info_page
        Bouquet.all.map do |bouquet|
            bouquet.description = second_scrape.css("div.product-single__description").children[1].text
            bouquet.detail_list << second_scrape.css("div.product-single__description li").children.each #do {|list| puts list }
        end
    end

    def print_bouquet_info(user_input) #iterates over all bouquet instances, selects the one that matches the user_input and prints the details and description
        Bouquet.all.each_with_index do |bouquet, index|
            if user_input - 1 == index
                puts "#{bouquet.name}"
                puts ""
                puts "Description: #{bouquet.description}"
                puts ""
                puts "Price: #{bouquet.price}"
                puts ""
                puts "Bundle includes: #{bouquet.detail_list}"
            else
            end
        end
    end

    


    
end

# FloralScraper.new.get_bouquet_info_page 
