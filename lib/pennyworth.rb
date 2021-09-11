# frozen_string_literal: true

require "zeitwerk"

Zeitwerk::Loader.for_gem.then do |loader|
  loader.inflector.inflect "cli" => "CLI",
                           "http_status" => "HTTPStatus",
                           "http_statuses" => "HTTPStatuses"
  loader.setup
end

# Main namespace.
module Pennyworth
end
