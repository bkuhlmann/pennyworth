# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::System::Signal do
  subject(:loader) { described_class.new }

  describe "#call" do
    it "answers records" do
      records = Signal.list.map do |(name, number)|
        Pennyworth::Models::System::Signal[number:, name:]
      end

      expect(loader.call).to match_array(records)
    end
  end
end
