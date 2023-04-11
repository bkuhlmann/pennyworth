# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::Text do
  using Refinements::Structs

  subject(:action) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    it "answers JSON" do
      action.call "an Example"
      expect(kernel).to have_received(:puts).with(/items.+title.+AnExample.+subtitle.+Camelcase/)
    end
  end
end
