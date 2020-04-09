# frozen_string_literal: true

module LogParser
  class Presenter
    def initialize(data)
      @data = data
    end

    def report
      report_most_visited
      indent_with_spaces
      report_most_unique_visited
    end

    private

    attr_reader :data

    def report_most_visited
      puts 'Most visited:'
      stats = data[:most_visited].map do |res_key, res_value|
        "#{res_key} #{res_value} visits"
      end.join("\n")
      puts stats
    end

    def report_most_unique_visited
      puts 'Most Unique visited:'
      stats = data[:most_unique_visited].map do |res_key, res_value|
        "#{res_key} #{res_value} unique visits"
      end.join("\n")
      puts stats
    end

    def indent_with_spaces
      3.times do
        puts
      end
    end
  end
end
