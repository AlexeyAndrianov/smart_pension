# frozen_string_literal: true

module LogParser
  class Record
    attr_reader :endpoint
    attr_reader :ip

    def initialize(endpoint, ip)
      @endpoint = endpoint
      @ip = ip
    end
  end
end
