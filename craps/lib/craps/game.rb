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

    def roll_dice
      11
    end
  end
end
