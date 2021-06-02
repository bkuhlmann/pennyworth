# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::System::Error do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::System::Error.new record }

  let :record do
    Pennyworth::Models::System::Error[
      id: 13,
      name: "Errno::EACCES",
      description: "Permission denied"
    ]
  end

  let :proof do
    {
      uid: 13,
      title: 13,
      subtitle: "Errno::EACCES: Permission denied.",
      arg: "Errno::EACCES",
      mods: {
        control: {
          subtitle: "Copy ID.",
          arg: 13
        },
        alt: {
          subtitle: "Copy description.",
          arg: "Permission denied"
        },
        cmd: {
          subtitle: "Copy ID, name, and description.",
          arg: "13, Errno::EACCES, Permission denied"
        }
      },
      text: {
        copy: "Errno::EACCES",
        largetype: "Errno::EACCES"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
