# frozen_string_literal: true

module LogParser
  module Statistics
    class MostVisited
      def self.gather_stats(records)
        analyzed_stats = records.reduce({}) do |stats, record|
          stats[record.endpoint] ? stats[record.endpoint] += 1 : stats[record.endpoint] = 1

          stats
        end
        analyzed_stats.sort_by { |_endpoint, count| -count }.to_h
      end
    end
  end
end
