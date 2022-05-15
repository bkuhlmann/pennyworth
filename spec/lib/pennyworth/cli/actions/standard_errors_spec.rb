# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::CLI::Actions::StandardErrors do
  subject(:action) { described_class.new }

  include_context "with application dependencies"
  include_context "with temporary directory"

  let :logger do
    Cogger::Client.new Logger.new(log_path),
                       formatter: ->(_severity, _name, _at, message) { "#{message}\n" }
  end

  let(:log_path) { temp_dir.join "standard_errors.json" }

  describe "#call" do
    it "answers JSON" do
      action.call
      expect(log_path.read).to match(/.+title.+ArgumentError.+arg.+ArgumentError/)
    end
  end
end
