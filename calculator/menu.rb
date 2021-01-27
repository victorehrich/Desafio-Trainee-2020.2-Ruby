require_relative 'operations'

module Calculator
  class Menu
    def initialize

    puts "-------------------------\n| Bem vindo a calculadora |\n-------------------------"
    puts "1. Operacao 1"
    puts "2. Operacao 2"
    puts "3. Sair"
    puts "Sua opção: "
    optionMenu = gets.chomp.to_i
    
    case optionMenu
      when 1
        Operations.new
        media = biased_mean()
      when 2
        numbers = gets.chomp
        puts numbers[numbers.length - 2]
        numero = Operations.new
        puts numero.no_integers(numbers)
                
      when 3
        
      else
        puts  "opcao invalida"
      end
    end
  end
end
