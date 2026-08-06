# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::RFC do
  subject(:filter) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::RFC.new record }

  let :record do
    Pennyworth::Models::RFC[
      number: "1",
      label: "RFC 1",
      description: "Host Software",
      published: "April 1969",
      uri: "https://www.rfc-editor.org/info/rfc1"
    ]
  end

  describe "#to_h" do
    let :proof do
      {
        uid: "1",
        title: "RFC 1",
        subtitle: "Host Software. Published: April 1969.",
        arg: "https://www.rfc-editor.org/info/rfc1",
        mods: {
          alt: {
            arg: "RFC 1",
            subtitle: "Copy label."
          },
          cmd: {
            arg: "Host Software",
            subtitle: "Copy description."
          },
          control: {
            arg: "1",
            subtitle: "Copy number."
          }
        },
        quicklookurl: "https://www.rfc-editor.org/info/rfc1",
        text: {
          copy: "https://www.rfc-editor.org/info/rfc1",
          largetype: "https://www.rfc-editor.org/info/rfc1"
        }
      }
    end

    it "answers hash" do
      expect(filter.to_h).to eq(proof)
    end
  end
end
