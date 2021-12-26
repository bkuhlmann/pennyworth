# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::System::Signals do
  subject(:loader) { described_class.new }

  describe "#call" do
    it "answers records" do
      records = Signal.list.map do |(name, number)|
        Pennyworth::Models::System::Signal[number:, name:]
      end

      expect(loader.call).to contain_exactly(*records)
    end
  end
end
