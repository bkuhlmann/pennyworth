# frozen_string_literal: true

module Pennyworth
  # Processes all steps required to render an Alfred Script Filter response.
  class Processor
    def initialize steps
      @steps = steps
      freeze
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
