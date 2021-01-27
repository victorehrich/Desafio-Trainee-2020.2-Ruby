require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)

    
    end
  
    def no_integers(numbers)
      
        if numbers[numbers.length-2] == '0'
          if numbers[numbers.length-3] == '5' || numbers[numbers.length-3] == '0'
            numbers = 'S'
          else
            numbers = 'N'
          end
        elsif numbers[numbers.length-2] == '5'
          if numbers[numbers.length-3] == '2' || numbers[numbers.length-3] == '7'
            numbers = 'S'
          else
            numbers = 'N'
          end
        else
          numbers = 'N'
      end
      
    end
  
    def filter_films(genres, year)
      films = get_films
  
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
