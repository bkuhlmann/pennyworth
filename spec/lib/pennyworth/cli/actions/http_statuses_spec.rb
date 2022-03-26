# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::HTTPStatuses do
  subject(:action) { described_class.new }

  include_context "with application container"

  describe "#call" do
    it "answers JSON" do
      action.call
      expect(logger.reread).to match(/items.+title.+200.+subtitle.+OK/)
    end
  end
end
