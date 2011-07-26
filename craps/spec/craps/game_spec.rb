require 'spec_helper'

module Craps
  describe Game do

    let(:output) { double('output').as_null_object }
    let(:input)  { double('input').as_null_object }
    let(:game)   { Game.new(output, input) }

    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with("Welcome to Craps.")
        game.start
      end

      it "asks the player to roll the dice" do
        output.should_receive(:puts).with("Do you want to roll the dice?")
        game.start
      end

      it "accepts the user input" do
        input.should_receive(:gets).and_return('yes')
        game.start
      end
    end

    describe "#roll_dice" do
      it "should show the result of the rolled dice" do
        game.roll_dice.should == 11
      end
    end
  end
end
