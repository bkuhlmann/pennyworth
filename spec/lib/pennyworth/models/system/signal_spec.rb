# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::System::Signal do
  subject(:record) { described_class.new }

  describe "#initialize" do
    it "answers default attributes" do
      expect(record).to have_attributes(number: nil, name: nil)
    end
  end
end
