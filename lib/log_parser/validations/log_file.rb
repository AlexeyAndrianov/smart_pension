# frozen_string_literal: true

module LogParser
  module Validations
    class LogFile
      def initialize(file_path)
        @file_path = file_path
      end

      def validate_file!
        raise NoFileError unless File.exist?(file_path)
        raise EmptyFileError if File.empty?(file_path)
      end

      private

      attr_reader :file_path
    end
  end
end
