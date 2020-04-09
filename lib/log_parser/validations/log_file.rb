# frozen_string_literal: true

module LogParser
  module Validations
    class LogFile
      def initialize(file_path)
        @file_path = file_path
      end

      def validate_file!
        file_exists? && file_not_empty?
      end

      private

      attr_reader :file_path

      def file_exists?
        raise NoFileError unless File.exist?(file_path)

        true
      end

      def file_not_empty?
        raise EmptyFileError if File.empty?(file_path)

        true
      end
    end
  end
end
