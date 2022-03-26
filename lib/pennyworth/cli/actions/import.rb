# frozen_string_literal: true

require "auto_injector"

module Pennyworth
  module CLI
    module Actions
      Import = AutoInjector[Container]
    end
  end
end
