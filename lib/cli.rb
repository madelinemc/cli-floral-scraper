require 'pry'
require 'nokogiri'
require 'open-uri'
require 'rainbow'

require_relative './bouquet.rb'
require_relative './cli-floral-scraper.rb'

@@logo = Rainbow("bl\u{0273F}\u{02740}m sh\u{0273B}p").color(135,215,95)

class CLI

    def welcome
        puts `clear`
        puts "\n\n\n      #{@@logo}\n\n\n\n\n"
        sleep(1)
        puts "Welcome to the bloom shop where you can choose from a bundle of flowers to DIY your own arrangement!"
        puts "\n\nHere is a list of all the available bundles:"
    end

    def run
        self.welcome
        my_floral_scraper = FloralScraper.new #make the thing and store it in instance variable so that it can be used in different ways
        my_floral_scraper.make_bouquets 
        user_input = nil
        until user_input == "exit"
            Bouquet.print_all_bouquets
            sleep(1)
            puts "\n\nIf you want to hear what flowers are in any of the bundles, just enter the number. Or you can type 'exit' anytime."
        
            user_input = gets.chomp
            if user_input.to_i > 0 && user_input.to_i < Bouquet.all.length + 1 
                
                selected_bouquet = Bouquet.find_by_index(user_input)  #find the bouquet the matches what the user entered
                my_floral_scraper.get_bouquet_info_page(selected_bouquet)
                selected_bouquet.print_selected_bouquet #use that bouquet instances to do the second scrape and then display it 
                
                puts "\n\nWould you like to make a bouquet with this bundle?"
                puts "\nEnter 'y' to select the bundle or 'n' to return to the list of all bundles.\n\n" 
                user_input = gets.chomp.downcase
                if user_input == "y"
                    puts "#{selected_bouquet.name} is a great choice! Thanks For shopping at the #{@@logo}!"
                    exit
                elsif user_input == "n"
                end
     
            elsif user_input == "exit"
                puts "Thanks for shopping at the #{@@logo}!"
                exit
            else
                puts "\nI've never heard of that flower! Can you try entering again?\n"
            end
        end
        
    end

end

#possible refactor: 

    # def run
    #     welcome
    #     user_input = ""
    #     until user_input == "exit"
    #         FloralScraper.all_bouquets
    #         user_input = gets.chomp
    #         if user_input.to_i > 0 && user_input.to_i < Bouquet.all.length + 1 
    #         FloralScraper.select_bouquet
    #         next_selection
    #     end
    #     puts "good bye message"
    #     exit 
    # end
