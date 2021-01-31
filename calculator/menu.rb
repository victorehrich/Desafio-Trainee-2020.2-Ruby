require_relative 'operations'

module Calculator
  class Menu
    def initialize

    puts "-------------------------\n| Bem vindo a calculadora |\n-------------------------"
    puts "1. Média preconceituosa"
    puts "2. Calculadora sem números"
    puts "3. Filtrar filmes"
    puts "4. Sair"
    puts "Sua opção: "
    optionMenu = gets.chomp.to_i
    
    #case de opcoes do menu
    case optionMenu
      when 1
        system ("cls")
        puts "Digite o JSON com alunos e notas:"
        grades = gets.chomp
        puts "Digite a blacklist:"
        blacklist = gets.chomp
        nota = Operations.new
        puts "Média: #{nota.biased_mean(grades,blacklist)}"
      when 2
        puts "Digite o número que deseja conferir:"
        numbers = gets.chomp.to_s
        numero = Operations.new
        puts numero.no_integers(numbers)             
      when 3
        puts "Digite o gênero:"
        genres = gets.chomp
        puts "Digite o ano:"
        year = gets.chomp
        filme = Operations.new
        puts filme.filter_films(genres,year)
      when 4
        exit
      else
        puts "Opção inválida:"
      end
    end
  end
end
