# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::StandardErrors do
  subject(:loader) { described_class.new }

  describe "#call" do
    let :proof do
      [
        Pennyworth::Models::StandardError[name: ArgumentError],
        Pennyworth::Models::StandardError[name: ThreadError, file_path: "<main>", line_number: 0]
      ]
    end

    it "answers unique and sorted records" do
      expect(loader.call).to match(array_including(proof))
    end
  end
end
