# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Serializers::Encoding do
  subject(:serializer) { described_class.new presenter }

  let(:presenter) { Pennyworth::Presenters::Encoding.new record }
  let(:record) { Pennyworth::Models::Encoding[name: "ASCII-8BIT", aliases: %w[BINARY]] }

  describe "#to_h" do
    it "answers hash with single alias" do
      expect(serializer.to_h).to eq(
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
      )
    end

    context "with multiple alises" do
      let(:record) { Pennyworth::Models::Encoding[name: "GB2312", aliases: %w[EUC-CN eucCN]] }

      it "answers hash" do
        expect(serializer.to_h).to eq(
          {
            uid: "GB2312",
            title: "GB2312",
            subtitle: "Aliases: EUC-CN and eucCN.",
            arg: "GB2312",
            mods: {
              alt: {
                arg: "EUC-CN, eucCN",
                subtitle: "Copy aliases."
              }
            },
            text: {
              copy: "GB2312",
              largetype: "GB2312"
            }
          }
        )
      end
    end
  end
end
