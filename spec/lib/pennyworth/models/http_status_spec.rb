# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::HTTPStatus do
  subject(:model) { described_class.new }

  describe "#initialize" do
    it "answers nil values by default" do
      expect(model).to have_attributes(code: nil, label: nil, url: nil)
    end
  end
end
