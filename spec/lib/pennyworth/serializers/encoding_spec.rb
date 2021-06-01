# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::Encoding do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::Encoding.new record }
  let(:record) { Pennyworth::Models::Encoding[name: "ASCII-8BIT", aliases: %w[BINARY]] }

  let :proof do
    {
      uid: "ASCII-8BIT",
      title: "ASCII-8BIT",
      subtitle: "Aliases: BINARY.",
      arg: "ASCII-8BIT",
      mods: {
        alt: {
          arg: "BINARY",
          subtitle: "Copy aliases."
        }
      },
      text: {
        copy: "ASCII-8BIT",
        largetype: "ASCII-8BIT"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
