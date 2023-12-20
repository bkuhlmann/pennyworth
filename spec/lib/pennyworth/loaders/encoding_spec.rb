# frozen_string_literal: true

require "spec_helper"
require "yaml"

RSpec.describe Pennyworth::Loaders::Encoding do
  subject(:loader) { described_class.new }

  describe "#call" do
    let :proof do
      YAML.load_file(SPEC_ROOT.join("support/fixtures/encodings.yml"))
          .map { |name, aliases| Pennyworth::Models::Encoding[name:, aliases:] }
    end

    it "answers unique and sorted records" do
      expect(loader.call).to eq(proof)
    end
  end
end
