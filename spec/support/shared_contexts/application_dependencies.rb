# frozen_string_literal: true

require "dry/container/stub"
require "infusible/stub"

RSpec.shared_context "with application dependencies" do
  using Infusible::Stub

  let(:configuration) { Pennyworth::Configuration::Loader.with_defaults.call }
  let(:kernel) { class_spy Kernel }

  let :logger do
    Cogger::Client.new Logger.new(StringIO.new),
                       formatter: -> _severity, _name, _at, message { "#{message}\n" }
  end

  before { Pennyworth::Import.stub configuration:, kernel:, logger: }

  after { Pennyworth::Import.unstub :configuration, :kernel, :logger }
end
