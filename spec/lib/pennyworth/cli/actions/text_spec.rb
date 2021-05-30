# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::Text do
  using Refinements::Structs

  subject(:action) { described_class.new }

  include_context "with application container"

  describe "#call" do
    it "answers JSON" do
      results = proc { action.call "an Example" }
      expect(&results).to output(/items.+title.+AnExample.+subtitle.+Camelcase/).to_stdout
    end
  end
end
