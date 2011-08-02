class TowerOfHanoi
  def initialize(no_of_discs)
    @peg1 = Stack.new
    ( 1..no_of_discs ).to_a.reverse.each { |n| @peg1.push(n) }
    @peg2 = Stack.new
    @peg3 = Stack.new
  end

  attr_accessor :peg1, :peg2, :peg3

  def move_disc
    peg3.push(peg1.pop)
  end
end
