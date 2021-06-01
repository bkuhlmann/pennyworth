# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::Encodings do
  subject(:loader) { described_class.new }

  describe "#call" do
    let :proof do
      [
        Pennyworth::Models::Encoding[name: "ASCII-8BIT", aliases: ["BINARY"]],
        Pennyworth::Models::Encoding[name: "Big5-HKSCS", aliases: ["Big5-HKSCS:2008"]],
        Pennyworth::Models::Encoding[name: "CP850", aliases: ["IBM850"]],
        Pennyworth::Models::Encoding[name: "EUC-JIS-2004", aliases: ["EUC-JISX0213"]],
        Pennyworth::Models::Encoding[name: "EUC-JP", aliases: ["eucJP"]],
        Pennyworth::Models::Encoding[name: "EUC-KR", aliases: ["eucKR"]],
        Pennyworth::Models::Encoding[name: "EUC-TW", aliases: ["eucTW"]],
        Pennyworth::Models::Encoding[name: "GB2312", aliases: %w[EUC-CN eucCN]],
        Pennyworth::Models::Encoding[name: "GBK", aliases: ["CP936"]],
        Pennyworth::Models::Encoding[name: "IBM037", aliases: ["ebcdic-cp-us"]],
        Pennyworth::Models::Encoding[name: "IBM437", aliases: ["CP437"]],
        Pennyworth::Models::Encoding[name: "IBM720", aliases: ["CP720"]],
        Pennyworth::Models::Encoding[name: "IBM737", aliases: ["CP737"]],
        Pennyworth::Models::Encoding[name: "IBM775", aliases: ["CP775"]],
        Pennyworth::Models::Encoding[name: "IBM857", aliases: ["CP857"]],
        Pennyworth::Models::Encoding[name: "IBM860", aliases: ["CP860"]],
        Pennyworth::Models::Encoding[name: "IBM861", aliases: ["CP861"]],
        Pennyworth::Models::Encoding[name: "IBM862", aliases: ["CP862"]],
        Pennyworth::Models::Encoding[name: "IBM863", aliases: ["CP863"]],
        Pennyworth::Models::Encoding[name: "IBM864", aliases: ["CP864"]],
        Pennyworth::Models::Encoding[name: "IBM865", aliases: ["CP865"]],
        Pennyworth::Models::Encoding[name: "IBM866", aliases: ["CP866"]],
        Pennyworth::Models::Encoding[name: "IBM869", aliases: ["CP869"]],
        Pennyworth::Models::Encoding[name: "ISO-2022-JP", aliases: ["ISO2022-JP"]],
        Pennyworth::Models::Encoding[name: "ISO-2022-JP-2", aliases: ["ISO2022-JP2"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-1", aliases: ["ISO8859-1"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-10", aliases: ["ISO8859-10"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-11", aliases: ["ISO8859-11"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-13", aliases: ["ISO8859-13"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-14", aliases: ["ISO8859-14"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-15", aliases: ["ISO8859-15"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-16", aliases: ["ISO8859-16"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-2", aliases: ["ISO8859-2"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-3", aliases: ["ISO8859-3"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-4", aliases: ["ISO8859-4"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-5", aliases: ["ISO8859-5"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-6", aliases: ["ISO8859-6"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-7", aliases: ["ISO8859-7"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-8", aliases: ["ISO8859-8"]],
        Pennyworth::Models::Encoding[name: "ISO-8859-9", aliases: ["ISO8859-9"]],
        Pennyworth::Models::Encoding[name: "KOI8-R", aliases: ["CP878"]],
        Pennyworth::Models::Encoding[name: "MacJapanese", aliases: ["MacJapan"]],
        Pennyworth::Models::Encoding[name: "US-ASCII", aliases: ["646", "ANSI_X3.4-1968", "ASCII"]],
        Pennyworth::Models::Encoding[name: "UTF-16BE", aliases: ["UCS-2BE"]],
        Pennyworth::Models::Encoding[name: "UTF-32BE", aliases: ["UCS-4BE"]],
        Pennyworth::Models::Encoding[name: "UTF-32LE", aliases: ["UCS-4LE"]],
        Pennyworth::Models::Encoding[name: "UTF-7", aliases: ["CP65000"]],
        Pennyworth::Models::Encoding[
          name: "UTF-8",
          aliases: %w[CP65001 external filesystem locale]
        ],
        Pennyworth::Models::Encoding[name: "UTF8-MAC", aliases: ["UTF-8-HFS", "UTF-8-MAC"]],
        Pennyworth::Models::Encoding[name: "Windows-1250", aliases: ["CP1250"]],
        Pennyworth::Models::Encoding[name: "Windows-1251", aliases: ["CP1251"]],
        Pennyworth::Models::Encoding[name: "Windows-1252", aliases: ["CP1252"]],
        Pennyworth::Models::Encoding[name: "Windows-1253", aliases: ["CP1253"]],
        Pennyworth::Models::Encoding[name: "Windows-1254", aliases: ["CP1254"]],
        Pennyworth::Models::Encoding[name: "Windows-1255", aliases: ["CP1255"]],
        Pennyworth::Models::Encoding[name: "Windows-1256", aliases: ["CP1256"]],
        Pennyworth::Models::Encoding[name: "Windows-1257", aliases: ["CP1257"]],
        Pennyworth::Models::Encoding[name: "Windows-1258", aliases: ["CP1258"]],
        Pennyworth::Models::Encoding[name: "Windows-31J", aliases: %w[CP932 PCK SJIS csWindows31J]],
        Pennyworth::Models::Encoding[name: "Windows-874", aliases: ["CP874"]],
        Pennyworth::Models::Encoding[name: "eucJP-ms", aliases: ["euc-jp-ms"]]
      ]
    end

    it "answers unique and sorted records" do
      expect(loader.call).to eq(proof)
    end
  end
end
