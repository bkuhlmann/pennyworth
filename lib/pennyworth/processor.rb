# frozen_string_literal: true

module Pennyworth
  # Processes all steps required to render an Alfred Script Filter response.
  class Processor
    def self.for_encodings
      new loader: Loaders::Encodings.new,
          presenter: Presenters::Encoding,
          serializer: Serializers::Encoding
    end

    def self.for_gems
      new loader: Loaders::Projects.for_ruby_gems,
          presenter: Presenters::Gem,
          serializer: Serializers::Project
    end

    def self.for_http_statuses
      new loader: Loaders::HTTPStatuses.new,
          presenter: Presenters::HTTPStatus,
          serializer: Serializers::HTTPStatus
    end

    def self.for_projects
      new loader: Loaders::Projects.for_git_hub,
          presenter: Presenters::Repository,
          serializer: Serializers::Project
    end

    def self.for_standard_gems
      new loader: Loaders::Projects.for_standard_gems,
          presenter: Presenters::StandardGem,
          serializer: Serializers::Project
    end

    def self.for_standard_errors
      new loader: Loaders::StandardErrors.new,
          presenter: Presenters::StandardError,
          serializer: Serializers::StandardError
    end

    def self.for_system_errors
      new loader: Loaders::System::Errors.new,
          presenter: Presenters::System::Error,
          serializer: Serializers::System::Error
    end

    def self.for_system_signals
      new loader: Loaders::System::Signals.new,
          presenter: Presenters::System::Signal,
          serializer: Serializers::System::Signal
    end

    def self.for_text
      new loader: Loaders::Text.new, presenter: Presenters::Text, serializer: Serializers::Text
    end

    def initialize steps
      @steps = steps
    end

    def call content = nil
      loader.call(content)
            .map { |record| presenter.new record }
            .sort_by(&:label)
            .map { |record| serializer.new record }
            .then { |records| {items: records.map(&:to_h)} }
    end

    private

    attr_reader :steps

    def loader = steps.fetch(__method__)

    def presenter = steps.fetch(__method__)

    def serializer = steps.fetch(__method__)
  end
end
