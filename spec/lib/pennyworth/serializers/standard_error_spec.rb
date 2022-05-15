# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::StandardError do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::StandardError.new record }

  let :record do
    Pennyworth::Models::StandardError[
      name: "ArgumentError",
      file_path: "/path/to/argument_error.rb",
      line_number: 20
    ]
  end

  let :proof do
    {
      uid: "ArgumentError",
      title: "ArgumentError",
      arg: "ArgumentError",
      mods: {
        control: {
          subtitle: "Copy label.",
          arg: "ArgumentError"
        },
        alt: {
          subtitle: "Copy path.",
          arg: "/path/to/argument_error.rb:20"
        }
      },
      text: {
        copy: "ArgumentError",
        largetype: "ArgumentError"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
