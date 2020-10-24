require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './bouquet.rb'
require_relative './cli-floral-scraper.rb'

class CLI

    def run
        puts "LOGO"
        sleep(1)
        puts "Welcome Message"
        my_floral_scraper = FloralScraper.new #make the thing and store it in instance variable so that it can be used in different ways
        my_floral_scraper.make_bouquets 
        Bouquet.print_all_bouquets
        sleep(1)
        puts "If you want to hear what flowers are in any of the bundles, just enter the number. Or you can type 'exit'"
        user_input = nil
            user_input = gets.chomp
            if user_input.to_i > 0 && user_input.to_i < Bouquet.all.length + 1 
                
                selected_bouquet = Bouquet.find_by_index(user_input)  #1.Find the bouquet the matches what the user entered
                my_floral_scraper.get_bouquet_info_page(selected_bouquet)
                selected_bouquet.print_selected_bouquet #write logic to find boquet here
            
                #2. Use that bouquet instances to do the second scrape and then display it 
                
                # Bouquet.all.each_with_index do |bouquet, index| index +1 == user_input 
                #     FloralScraper.new.get_bouquet_info_page(bouquet) # figure out how to pass bouquet instance
                #     FloralScraper.new.print_bouquet_info(user_input)
                # end
                puts "\n\nWould you like to make a bouquet with this bundle?"
                puts "\nEnter 'y' to select the bundle and receive some floral arrangement tips or 'n' to return to the list of all bundles." #add or return to bouquet list
            elsif user_input == "exit"
                puts "Thanks for shopping at the Flower Shop!"
                exit
            else
                puts "I've never heard of that flower! Can you try entering again?"
            end
        
    end

end



#         until
#         FloralScraper.new.print_bouquets
#         sleep(2)
#         puts "If you want to hear what flowers are in any of the bundles, just enter the number. Or you can type 'exit.'"
#         user_input = nil
#         while user_input != "exit"
#             user_input = gets.chomp
#             if user_input.to_i > 0 && user_input.to_i < Bouquet.self.all.length + 1
#                 index = user_input.to_i + 1
#                 return index
#             elsif user_input == "exit"
#                 puts "Good Bye Message!"
#                 exit
#             else
#                 puts "I've never heard of that flower! Can you try entering again?"
#             end
#         end
#     end
#         input

# end