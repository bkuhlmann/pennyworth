# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::HTMX do
  subject(:filter) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::HTMX.new record }

  let :record do
    Pennyworth::Models::HTMX[
      label: "hx-get",
      description: "Issues a `GET` to the specified URL.",
      uri: "https://htmx.org/attributes/hx-get"
    ]
  end

  describe "#to_h" do
    let :proof do
      {
        uid: "hx-get",
        title: "hx-get",
        subtitle: "Issues a `GET` to the specified URL.",
        arg: "https://htmx.org/attributes/hx-get",
        mods: {
          alt: {
            subtitle: "Copy label.",
            arg: "hx-get"
          },
          cmd: {
            subtitle: "Copy description.",
            arg: "Issues a `GET` to the specified URL."
          }
        },
        quicklookurl: "https://htmx.org/attributes/hx-get",
        text: {
          copy: "https://htmx.org/attributes/hx-get",
          largetype: "https://htmx.org/attributes/hx-get"
        }
      }
    end

    it "answers hash" do
      expect(filter.to_h).to eq(proof)
    end
  end
end
