# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::HTTPStatuses do
  subject(:action) { described_class.new }

  include_context "with application dependencies"

  describe "#call" do
    it "answers JSON" do
      action.call
      expect(kernel).to have_received(:puts).with(/items.+title.+200.+subtitle.+OK/)
    end
  end
end
