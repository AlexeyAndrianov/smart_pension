# frozen_string_literal: true

module LogParser
  class NoFileError < StandardError
    def initialize(error_message = 'File not found!')
      super
    end
  end
end
