# frozen_string_literal: true

module LogParser
  class Processor
    def initialize(file_path)
      @file_path = file_path
    end

    def read_from_file
      File.readlines(file_path).map(&method(:make_record))
    end

    private

    attr_reader :file_path

    def make_record(line)
      LogParser::Record.new(*line.split(' '))
    end
  end
end
