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
  game.roll_dice(6, 5)
  output.messages.should include("Player rolled 6 + 5 = 11")
end

Given /^I accept to roll the dice$/ do
  input.gets.should == 'yes'
end

When /^Dice's are rolled as "([^"]*)" and "([^"]*)"$/ do |dice1, dice2|
  @dice1, @dice2 = dice1, dice2
end

Then /^I should see the "([^"]*)" and "([^"]*)"$/ do |result, game_status|
  game.roll_dice(@dice1, @dice2)
  output.messages.should include("Player rolled #{@dice1} + #{@dice2} = #{result}")
  output.messages.should include(game_status)
end

When /^The result is equal to the "([^"]*)"$/ do |point|
  game.next_roll(@dice1, @dice2, point)
end

When /^The result is equal to (\d+)$/ do |point|
  game.next_roll(@dice1, @dice2, point)
end

When /^The result is not equal to the "([^"]*)"$/ do |point|
  game.next_roll(@dice1, @dice2, point)
end
