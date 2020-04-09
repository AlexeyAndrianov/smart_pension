# frozen_string_literal: true

module LogParser
  module Validations
    class LogFile
      def initialize(file_path)
        @file_path = file_path
        @errors = []
      end

      def validate_file!
        return true if file_exists? && file_not_empty?

        puts 'Validation has failed with following errors:'
        raise StandardError, errors.join(', ')
      end

      private

      attr_reader :file_path, :errors

      def file_exists?
        open_file
      rescue Errno::ENOENT
        add_error('File not found!')
        false
      end

      def file_not_empty?
        result = !open_file.read.empty?

        errors.push('File is empty!') unless result

        result
      end

      def open_file
        File.open(@file_path, 'r')
      end

      def add_error(error)
        errors.push(error)
      end
    end
  end
end
