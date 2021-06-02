# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::HTTPStatus do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::HTTPStatus.new record }

  let :record do
    Pennyworth::Models::HTTPStatus[code: 200, label: "OK", url: "https://httpstatuses.com/200"]
  end

  let :proof do
    {
      uid: 200,
      title: 200,
      subtitle: "OK",
      arg: ":ok",
      mods: {
        control: {
          subtitle: "Copy code.",
          arg: 200
        },
        alt: {
          subtitle: "Copy label.",
          arg: "OK"
        },
        cmd: {
          subtitle: "View documentation.",
          arg: "https://httpstatuses.com/200"
        }
      },
      text: {
        copy: "200 OK",
        largetype: "200 OK"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
