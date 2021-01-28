require_relative 'operations'

module Calculator
  class Menu
    def initialize

    puts "-------------------------\n| Bem vindo a calculadora |\n-------------------------"
    puts "1. Operacao 1"
    puts "2. Operacao 2"
    puts "3. Operacao 3"
    puts "4. Sair"
    puts "Sua opção: "
    optionMenu = gets.chomp.to_i
    
    #case de opcoes do menu
    case optionMenu
      when 1
        Operations.new
        media = biased_mean()
      when 2
        puts "Digite o numero"
        numbers = gets.chomp.to_s
      #colocar um bloquei de tipo integer
        numero = Operations.new
        puts numero.no_integers(numbers)             
      when 3
        puts "Digite o genero"
        genres = gets.chomp
        puts "Digite o ano"
        year = gets.chomp
        filme = Operations.new
        puts filme.filter_films(genres,year)
      when 4
        
      else
        puts  "opcao invalida"
      end
    end
  end
end
