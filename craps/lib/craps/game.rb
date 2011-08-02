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

#    def self.random_number
#      random_array = (1..6).to_a
#      random_array[rand(random_array.size)]
#    end

#    dice1 = Game.random_number
#    dice2 = Game.random_number

    def roll_dice(dice1, dice2)
      @sum   = dice1.to_i + dice2.to_i
      @output.puts "Player rolled #{dice1} + #{dice2} = #{@sum}"
      game_status_after_first_throw
    end

    def next_roll(dice1, dice2, point)
      @sum = dice1.to_i + dice2.to_i
      game_status(point)
    end

    def game_status_after_first_throw
      if([2,3,12].include?(@sum)) then lost
      elsif([7,11].include?(@sum)) then won
      elsif([4,5,6,8,9,10].include?(@sum)) then
        @output.puts "your point is #{@sum}"
        continue
      end
    end

    def game_status(point)
      if @sum == 7 then lost(point)
      elsif @sum == point.to_i then won(point)
      else continue
      end
    end

    def won(point = 0)
      if point != 0 then
        @output.puts "your sum: #{@sum} is equal to your point: #{point}"
        @output.puts "you made your point."
      end
      @output.puts "you won the game"
    end

    def lost(point = 0)
      if point != 0 then
        @output.puts "you rolled 7 before making your point: #{point}"
      end
      @output.puts "you lost the game"
    end

    def continue
      @output.puts "your sum is #{@sum}"
      @output.puts "do you want to continue rolling the dice?"
    end
  end
end
