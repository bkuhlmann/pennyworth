# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::StandardError do
  subject(:model) { described_class.new }

  describe "#initialize" do
    it "answers nil values by default" do
      expect(model).to have_attributes(name: nil, file_path: nil, line_number: nil)
    end
  end
end
