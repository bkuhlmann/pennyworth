# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "cli" => "CLI", "http_status" => "HTTPStatus"
loader.setup

# Main namespace.
module Pennyworth
end
