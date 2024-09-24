# frozen_string_literal: true

module Pennyworth
  # Processes all steps required to render an Alfred Script Filter response.
  class Processor
    def self.for_encodings
      new loader: Loaders::Encoding.new,
          presenter: Presenters::Encoding,
          serializer: Serializers::Encoding
    end

    def self.for_gems
      new loader: Loaders::Gem.new, presenter: Presenters::Gem, serializer: Serializers::Project
    end

    def self.for_http_statuses
      new loader: Loaders::HTTPStatus.new,
          presenter: Presenters::HTTPStatus,
          serializer: Serializers::HTTPStatus
    end

    def self.for_htmx
      new loader: Loaders::HTMX.new, presenter: Presenters::HTMX, serializer: Serializers::HTMX
    end

    def self.for_projects
      new loader: Loaders::GitHub.new,
          presenter: Presenters::Repository,
          serializer: Serializers::Project
    end

    def self.for_standard_gems
      new loader: Loaders::StandardGem.new,
          presenter: Presenters::StandardGem,
          serializer: Serializers::Project
    end

    def self.for_standard_errors
      new loader: Loaders::StandardError.new,
          presenter: Presenters::StandardError,
          serializer: Serializers::StandardError
    end

    def self.for_system_errors
      new loader: Loaders::System::Error.new,
          presenter: Presenters::System::Error,
          serializer: Serializers::System::Error
    end

    def self.for_system_signals
      new loader: Loaders::System::Signal.new,
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
