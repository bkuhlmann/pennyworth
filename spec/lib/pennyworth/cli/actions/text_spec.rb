# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::Text do
  using Refinements::StringIO
  using Refinements::Struct

  subject(:action) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    it "answers JSON" do
      action.call "an Example"
      expect(io.reread).to match(/items.+title.+AnExample.+subtitle.+Camelcase/)
    end
  end
end
