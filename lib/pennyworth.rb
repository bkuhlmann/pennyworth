# frozen_string_literal: true

require "zeitwerk"

Zeitwerk::Loader.new.then do |loader|
  loader.inflector.inflect "cli" => "CLI",
                           "http_status" => "HTTPStatus",
                           "http_statuses" => "HTTPStatuses"
  loader.tag = File.basename __FILE__, ".rb"
  loader.push_dir __dir__
  loader.setup
end

# Main namespace.
module Pennyworth
  def self.loader(registry = Zeitwerk::Registry) = registry.loader_for __FILE__
end
