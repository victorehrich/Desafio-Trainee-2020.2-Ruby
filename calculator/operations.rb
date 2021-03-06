require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      notas = JSON.parse(grades)

        i = 0
        z = 0
        media = 0
        cont = 0
        while i < notas.length
          while z < blacklist.split.length
            if notas.keys[i] == blacklist.split[z]
              notas.delete(blacklist.split[z])
            end
            z+=1
          end
          i+=1
          z=0
        end

        i=0
        while i < notas.length
          media += notas.values[i]
          cont += 1
          i += 1
        end
        result = media/cont
    end
  
    def no_integers(numbers)
      
      i=0
      resultado = []
      numero = numbers.split
      while i < numero.length
        if numero[i][numero[i].length-2] == '0'
          if numero[i][numero[i].length-3] == '5' || numero[i][numero[i].length-3] == '0'
            resultado[i] = 'S '
          else
            resultado[i] = 'N '
          end
        elsif numero[i][numero[i].length-2] === '5'
          if numero[i][numero[i].length-3] === '2' || numero[i][numero[i].length-3] == '7'
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
      genresArray = genres.split  
      
      i=0;
      while i<filmes.length
        if (genresArray - filmes[i][:genres]).empty?
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
