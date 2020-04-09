# frozen_string_literal: true

module LogParser
  class EmptyFileError < StandardError
    def initialize(error_message = 'File is empty!')
      super
    end
  end
end
