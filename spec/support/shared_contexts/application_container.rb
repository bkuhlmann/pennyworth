# frozen_string_literal: true

require "dry/container/stub"

RSpec.shared_context "with application container" do
  let(:application_container) { Pennyworth::Container }
  let(:application_configuration) { Pennyworth::CLI::Configuration::Loader.with_defaults.call }
  let(:kernel) { class_spy Kernel }

  before do
    application_container.enable_stubs!
    application_container.stub :configuration, application_configuration
    application_container.stub :kernel, kernel
  end

  after do
    application_container.unstub :application_configuration
    application_container.unstub :kernel
  end
end
