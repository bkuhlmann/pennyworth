# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::Text do
  subject(:record) { described_class.new }

  describe "#initialize" do
    it "answers default attributes" do
      expect(record).to have_attributes(id: nil, content: nil)
    end
  end
end
