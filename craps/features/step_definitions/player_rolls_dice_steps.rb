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
  game.roll_dice
  output.messages.should include("Player rolled 6 + 5 = 11")
end

Given /^I have rolled the dice$/ do
  game.roll_dice
end

When /^Dice one rolled "([^"]*)"$/ do |dice1|
  game.stub(:dice1).and_return(dice1.to_i)
  game.dice1.should == dice1.to_i

end

When /^Dice two rolled "([^"]*)"$/ do |dice2|
  game.stub(:dice2).and_return(dice2.to_i)
  game.dice2.should == dice2.to_i
end

Then /^I should see the "([^"]*)"$/ do |result|
  output.messages.should include(result)
end
