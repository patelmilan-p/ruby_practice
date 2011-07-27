module Craps
  class Game


    def initialize(output, input)
      @output = output
      @input  = input
    end

    def start
      @output.puts 'Welcome to Craps.'
      @output.puts 'Do you want to roll the dice?'
      @input.gets
    end

    def random_number
      random_array = (1..6).to_a
      random_array[rand(random_array.size)]
    end

    def dice1
      random_number
    end

    def dice2
      random_number
    end

    def roll_dice
      d1 = dice1
      d2 = dice2
      sum   = d1 + d2
      @output.puts "Player rolled #{d1} + #{d2} = #{sum}"
      @output.puts "Player rolled 6 + 5 = 11"
    end
  end
end
