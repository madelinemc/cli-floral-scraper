require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './bouquet.rb'
require_relative './cli.rb'

class FloralScraper

    def initialize
        @base_url = "https://www.hbloom.com"
    end


    #first scrape
    def get_page
        html = open(@base_url + "/collections/florist-crafted-bouquets")
        html_parsed_to_elements = Nokogiri::HTML(html)
    end

    def get_bouquets
        self.get_page.css(".grid__item--collection-template")
    end

    def make_bouquets
        self.get_bouquets.each do |bouquet_item|
            bouquet = Bouquet.new
            bouquet.name = bouquet_item.css(".h4").text
            bouquet.price = bouquet_item.css(".price-item.price-item--regular").text.strip
            bouquet.link = bouquet_item.css("a.grid-view-item__link").attr('href').value
        end
    end


    #second scrape
    def get_bouquet_info_page(bouquet)
        second_html = open(@base_url + bouquet.link)
        second_html_parsed_to_elements = Nokogiri::HTML(second_html)
        #adds description and detail list from second scrape to each Bouquet instance.
        bouquet.description = second_html_parsed_to_elements.css("div.product-single__description").children[1].text 
        if bouquet.description.empty? #exception for index 19 - website constructed differently.
            bouquet.description = second_html_parsed_to_elements.css("div.product-single__description").children[0].text.strip
        end
        bouquet.detail_list = second_html_parsed_to_elements.css("div.product-single__description li").children.map { |element| element.text}
        bouquet.detail_list.delete_at(-1)
    end

    
end
