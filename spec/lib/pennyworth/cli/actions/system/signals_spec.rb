# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::System::Signals do
  subject(:action) { described_class.new }

  include_context "with application container"

  describe "#call" do
    it "answers JSON" do
      results = proc { action.call }
      expect(&results).to output(/items.+title.+ABRT.+subtitle.+6/).to_stdout
    end
  end
end
