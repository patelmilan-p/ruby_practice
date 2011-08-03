require 'spec_helper'

describe TowerOfHanoi do
  let(:tower) { tower = TowerOfHanoi.new(4) }

  it "when initialized peg1 should have discs" do
    tower.peg1.should_not be_empty
  end

  describe "TowerOfHanoi#move_disc" do
    it "exactly one disc is moved at a time" do
      tower.move_disc
      tower.peg1.length.should == 3
      tower.peg3.length.should == 1
    end

    it "at any time smaller disc is always placed on lager disc" do
      tower.move_disc
      tower.peg
    end
  end
end
