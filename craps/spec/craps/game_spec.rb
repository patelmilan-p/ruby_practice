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
        output.should_receive(:puts).with("Player rolled 6 + 5 = 11")
        game.roll_dice(6, 5)
      end

      context "when player lose" do
        it "should display appropriately" do
          output.should_receive(:puts).with("you lost the game")
          game.roll_dice(6, 6)
        end
      end

      context "when player win" do
        it "should display appropriately" do
          output.should_receive(:puts).with("you won the game")
          game.roll_dice(5, 6)
        end
      end

      context "when player makes a 'point'" do
        it "should display the point and prompt to continue" do
          output.should_receive(:puts).with("your point is 8")
          output.should_receive(:puts).with("do you want to continue rolling the dice?")
          game.roll_dice(4, 4)
        end
      end
    end

    describe "next_roll" do
      context "when player makes his point and wins" do
        it "should display 'you won the game'" do
          output.should_receive(:puts).with("you won the game")
          game.next_roll(2, 3, 5)
        end
      end

      context "when player throws 7 and loses" do
        it "should display 'you lost the game'" do
          output.should_receive(:puts).with("you lost the game")
          game.next_roll(3, 4, 7)
        end
      end

      context "when player does not make a point and continues" do
        it "should display the sum and prompt to continue" do
          output.should_receive(:puts).with("your sum is 9")
          output.should_receive(:puts).with("do you want to continue rolling the dice?")
          game.next_roll(4, 5, 10)
        end
      end
    end
  end
end
