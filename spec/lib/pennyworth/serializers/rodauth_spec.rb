# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::Rodauth do
  subject(:filter) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::Rodauth.new record }

  let :record do
    Pennyworth::Models::Rodauth[
      name: "base",
      label: "Base",
      description: "Shared behavior for other features.",
      uri: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html"
    ]
  end

  describe "#to_h" do
    let :proof do
      {
        uid: "base",
        title: "Base",
        subtitle: "Shared behavior for other features.",
        arg: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html",
        mods: {
          alt: {
            subtitle: "Copy label.",
            arg: "Base"
          },
          cmd: {
            subtitle: "Copy description.",
            arg: "Shared behavior for other features."
          },
          control: {
            subtitle: "Copy name.",
            arg: "base"
          }
        },
        quicklookurl: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html",
        text: {
          copy: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html",
          largetype: "https://rodauth.jeremyevans.net/rdoc/files/doc/base_rdoc.html"
        }
      }
    end

    it "answers hash" do
      expect(filter.to_h).to eq(proof)
    end
  end
end
