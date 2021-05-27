# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::Project do
  subject(:serializer) { described_class.new presenter }

  include_context "with RubyGems integration"

  let(:presenter) { Pennyworth::Presenters::Gem.new ruby_gems_record }

  let :proof do
    {
      uid: "test",
      title: "Test",
      subtitle: "Version: 0.1.0. Updated: 2021-05-20. Licenses: MIT. Downloads: 1000.",
      arg: "https://site.example.com",
      quicklookurl: "https://site.example.com",
      mods: {
        control: {
          subtitle: "View changes.",
          arg: "https://changes.example.com"
        },
        alt: {
          subtitle: "View source.",
          arg: "https://source.example.com"
        },
        cmd: {
          subtitle: "View issues.",
          arg: "https://issues.example.com"
        }
      },
      text: {
        copy: "https://site.example.com",
        largetype: "https://site.example.com"
      }
    }
  end

  describe "#to_h" do
    it "answers hash" do
      expect(serializer.to_h).to eq(proof)
    end
  end
end
