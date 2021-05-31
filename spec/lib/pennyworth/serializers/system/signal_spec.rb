# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::System::Signal do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::System::Signal.new record }
  let(:record) { Pennyworth::Models::System::Signal[number: 30, name: "USR1"] }

  let :proof do
    {
      uid: 30,
      title: "USR1",
      subtitle: 30,
      arg: "USR1",
      mods: {
        alt: {subtitle: "Copy ID.", arg: 30},
        cmd: {subtitle: "Copy ID and name.", arg: "30, USR1"}
      },
      text: {
        copy: "USR1",
        largetype: "USR1"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
