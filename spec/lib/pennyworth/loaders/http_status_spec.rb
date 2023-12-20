# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::HTTPStatus do
  subject(:loader) { described_class.new }

  describe "#call" do
    let :proof do
      [
        Pennyworth::Models::HTTPStatus[
          code: 100,
          label: "Continue",
          url: "https://developer.mozilla.org/docs/Web/HTTP/Status/100"
        ],
        Pennyworth::Models::HTTPStatus[
          code: 101,
          label: "Switching Protocols",
          url: "https://developer.mozilla.org/docs/Web/HTTP/Status/101"
        ],
        Pennyworth::Models::HTTPStatus[
          code: 102,
          label: "Processing",
          url: "https://developer.mozilla.org/docs/Web/HTTP/Status/102"
        ]
      ]
    end

    it "answers sorted records" do
      expect(loader.call).to match(array_including(proof))
    end
  end
end
