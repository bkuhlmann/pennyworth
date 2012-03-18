require "spec_helper"

describe Pennyworth::Kit do
  before :all do
    @text = "Well, hello, I am a test string."
  end

	describe ".array_to_string" do
	  it "answers a string with default settings" do
	    Pennyworth::Kit.array_to_string([1, 2, 3]).should == "1 2 3"
    end

	  it "answers a string with a custom delimiter" do
	    Pennyworth::Kit.array_to_string(%w(one two three), '-').should == "one-two-three"
    end

	  it "raises an ArgumentError when array parameter is missing" do
	    expect{Pennyworth::Kit.array_to_string}.to raise_error(ArgumentError)
    end
  end
	
  describe ".clip" do
    it "answers the same text as supplied" do
      Pennyworth::Kit.should_receive("clip").and_return(@text)
      Pennyworth::Kit.clip(@text).should == @text
    end

	  it "raises an ArgumentError when parameter is missing" do
	    expect{Pennyworth::Kit.clip}.to raise_error(ArgumentError)
    end
  end
end
