require 'spec_helper'

describe Stack do
  let(:stack) { stack = Stack.new }

  it "when created should be empty" do
    stack.should be_empty
  end

  it "when an element is pushed should not be empty" do
    stack.push(1)
    stack.should_not be_empty
  end

  describe 'Stack#pop' do
    it "while popping the last pushed element should be returned and removed from the stack" do
      stack.push(2)
      stack.pop
      stack.should be_empty
    end

    it "while stack is empty when popped should raise error" do
      lambda { stack.pop }.should raise_error
    end

    it "the element popped should be the last pushed element" do
      stack.push(2)
      stack.push(1)
      popped = stack.pop
      popped.should == 1
    end
  end

  it "when peeked last pushed element should be returned without removing it" do
    stack.push(1)
    stack.push(2)
    stack.peek.should == 2
    stack.length.should == 2
  end
end
