# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::HTTPStatuses do
  subject(:loader) { described_class.new }

  describe "#call" do
    let :proof do
      [
        Pennyworth::Models::HTTPStatus[
          code: 100,
          label: "Continue",
          url: "https://httpstatuses.com/100"
        ],
        Pennyworth::Models::HTTPStatus[
          code: 101,
          label: "Switching Protocols",
          url: "https://httpstatuses.com/101"
        ],
        Pennyworth::Models::HTTPStatus[
          code: 102,
          label: "Processing",
          url: "https://httpstatuses.com/102"
        ]
      ]
    end

    it "answers sorted records" do
      expect(loader.call).to match(array_including(proof))
    end
  end
end
