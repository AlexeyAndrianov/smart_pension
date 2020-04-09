# frozen_string_literal: true

require_relative 'lib/log_parser/runner.rb'
require_relative 'lib/log_parser/record.rb'
require_relative 'lib/log_parser/processor.rb'
require_relative 'lib/log_parser/analyzer.rb'
require_relative 'lib/log_parser/statistics/most_visited.rb'
require_relative 'lib/log_parser/statistics/most_unique_visited.rb'

file_path = ARGV[0]
LogParser::Runner.new(file_path).perform_analytics
