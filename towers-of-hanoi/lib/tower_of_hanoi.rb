require 'stack'
require 'ruby-debug'
#debugger

class TowerOfHanoi
  def initialize(no_of_discs)
    @peg1 = Stack.new('peg1')
    (1..no_of_discs).to_a.reverse.each { |n| @peg1.push(n) }
    @peg2 = Stack.new('peg2')
    @peg3 = Stack.new('peg3')
  end

  attr_accessor :peg1, :peg2, :peg3


  def move_disc(no_of_discs, source, destination, temporary)
    if no_of_discs == 1
      disc = source.pop
      destination.push(disc)
      puts "#{source.to_s} --> #{destination.to_s}"
      @count += 1
    else
      move_disc(no_of_discs - 1, source, temporary, destination)
      move_disc(1, source, destination, temporary)
      move_disc(no_of_discs - 1, temporary, destination, source)
    end
  end

  def solve
    @count = 0
    move_disc(peg1.length, peg1, peg3, peg2)
    puts "steps: #{@count}"
  end
end
