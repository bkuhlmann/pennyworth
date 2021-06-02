# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Models::HTTPStatus do
  subject(:http_status) { described_class.new }

  describe "#initialize" do
    it "answers default attributes" do
      expect(http_status).to have_attributes(code: nil, label: nil, url: nil)
    end
  end
end
