# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::Encodings do
  subject(:action) { described_class.new }

  include_context "with application container"

  describe "#call" do
    it "answers JSON" do
      results = proc { action.call }
      expect(&results).to output(/items.+title.+ASCII-8BIT.+subtitle.+BINARY/).to_stdout
    end
  end
end
