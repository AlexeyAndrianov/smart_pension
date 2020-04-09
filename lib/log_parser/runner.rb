# frozen_string_literal: true

module LogParser
  class Runner
    def initialize(file_path)
      @file_path = file_path
    end

    def perform_analytics
      analyzed = analyzer.new(processor).perform
      presenter.new(analyzed).report
    end

    private

    attr_reader :file_path

    def processor
      LogParser::Processor.new(file_path)
    end

    def analyzer
      LogParser::Analyzer
    end

    def presenter
      LogParser::Presenter
    end
  end
end
