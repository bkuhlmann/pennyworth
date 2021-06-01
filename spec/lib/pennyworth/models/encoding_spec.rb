# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::Encoding do
  subject(:record) { described_class.new }

  describe "#initialize" do
    it "answers default attributes" do
      expect(record).to have_attributes(name: nil, aliases: nil)
    end
  end
end
