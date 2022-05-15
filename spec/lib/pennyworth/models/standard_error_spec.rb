# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::StandardError do
  subject(:record) { described_class.new }

  describe "#initialize" do
    it "answers default attributes" do
      expect(record).to have_attributes(name: nil, file_path: nil, line_number: nil)
    end
  end
end
