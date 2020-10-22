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
        FloralScraper.new.print_bouquets
        sleep(2)
        puts "If you want to hear what flowers are in any of the bundles, just enter the number. Or you can type 'exit'"
        user_input = nil
        while user_input != "exit"
            user_input = gets.chomp.to_i
            if user_input.to_i > 0 && user_input.to_i < Bouquet.all.length + 1   
            FloralScraper.new.print_bouquet_info(user_input)
            puts "Would you like to make a bouquet with this bundle?" #add or return to bouquet list
            elsif user_input == "exit"
                puts "Thanks for shopping at the Flower Shop!"
                exit
            else
                puts "I've never heard of that flower! Can you try entering again?"
            end
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