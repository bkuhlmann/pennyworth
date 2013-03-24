require "spec_helper"

describe Pennyworth::Kits::Clipboard do  
  describe ".clip" do
    let(:text) {"Well, hello, I am a test string."}

    it "answers the same text as supplied" do
      Pennyworth::Kits::Clipboard.should_receive("copy").and_return(@text)
      Pennyworth::Kits::Clipboard.copy(@text).should == @text
    end

    it "raises an ArgumentError when parameter is missing" do
      expect{Pennyworth::Kits::Clipboard.copy}.to raise_error(ArgumentError)
    end
  end
end

