require 'spec_helper'

describe TowerOfHanoi do
  let(:tower) { tower = TowerOfHanoi.new(4) }

  it "when initialized peg1 should have discs" do
    tower.peg1.should_not be_empty
  end

  describe "TowerOfHanoi#moving_discs" do
    it "exactly one disc is moved at a time" do
      tower.move_disc
      tower.peg1.should_receive(:pop)
      tower.peg3.should_receive(:push).with(tower.peg1.pop)
    end
  end
end
