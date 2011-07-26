class Input
  def gets
    'yes'
  end
end

def input
  @input ||= Input.new
end

When /^I want to roll the dice$/ do
  input.gets.should == 'yes'
end

Then /^I should see the result of the rolled dice$/ do
  game.roll_dice.should == 11
end
