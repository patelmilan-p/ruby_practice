Given /^I am not yet playing the game$/ do
end

When /^I start the game$/ do
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

def game
  @game ||= Craps::Game.new(output, input)
end
