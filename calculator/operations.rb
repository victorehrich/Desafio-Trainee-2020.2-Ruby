require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)

    
    end
  
    def no_integers(numbers)
      
      i=0
      resultado = []
      numero = numbers.scan(/\w+/)

      while i < numero.length
        if numero[i][numero[i].length-2] == '0'
          if numero[i][numero[i].length-3] == '5' || numero[i][numero[i].length-3] == '0'
            resultado[i] = 'S '
          else
            resultado[i] = 'N '
          end
        elsif numero[i][numero[i].length-2] == '5'
          if numero[i][numero[i].length-3] == '2' || numero[i][numero[i].length-3] == '7'
            resultado[i] = 'S '
          else
            resultado[i] = 'N '
          end
        else
          resultado[i] = 'N '
        end
        i+=1
      end
      i=0
      numbers = ""
      while i<resultado.length
       numbers << resultado[i]
       i+=1
      end
      numbers
      
    end
  
    def filter_films(genres, year)
      films = get_films
      filmes = films[:movies]      
      
      i=0;
      while i<filmes.length
        if filmes[i][:genres].include?(genres)
          if filmes[i][:year] >= year
            puts filmes[i][:title]
          end
        end
      i+=1
      end
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
