# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::Text do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::Text.new record }
  let(:record) { Pennyworth::Models::Text[id: "upcase", content: "TEST"] }

  let :proof do
    {
      uid: "upcase",
      title: "TEST",
      subtitle: "Upcase",
      arg: "TEST",
      icon: {
        path: "text/upcase.png"
      },
      text: {
        copy: "TEST",
        largetype: "TEST"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
