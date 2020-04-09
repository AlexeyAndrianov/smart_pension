# frozen_string_literal: true

module LogParser
  class Analyzer
    def initialize(processor)
      @records = processor.read_from_file
    end

    def perform
      {
        most_visited: LogParser::Statistics::MostVisited.gather_stats(records),
        most_unique_visited: LogParser::Statistics::MostUniqueVisited.gather_stats(records)
      }
    end

    private

    attr_reader :records
  end
end
