# frozen_string_literal: true

module LogParser
  module Statistics
    class MostUniqueVisited
      def self.gather_stats(records)
        result = {}
        grouped = records.group_by(&:endpoint)

        grouped.each do |endpoint, record|
          result[endpoint] = record.map(&:ip).uniq.count
        end
        result.sort_by(&:last).reverse.to_h
      end
    end
  end
end
