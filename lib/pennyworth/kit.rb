module Pennyworth
  # Provides supplementary utility methods.
  class Kit
    # Builds a string from an array.
    # ==== Parameters
    # * +array+ - Required. The array to build a string from.
    # * +delimiter+ - Optional. The delimiter used to join each array element. Default: ' ' 
    def self.array_to_string array, delimiter = ' '
      array * delimiter
    end

    # Sends text to the Mac OS clipboard.
    # ==== Parameters
    # * +text+ - Required. The text to send to the clipboard.
    def self.clip text
      IO.popen("pbcopy", 'w').print text
      text
    end
  end
end