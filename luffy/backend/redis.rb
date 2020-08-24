require 'json'
require 'redis'

module Luffy
  module Backend
    class Redis
      def initialize(connection = ::Redis.new)
        @connection = connection
      end

      def push(job)
        @connection.lpush('luffy:queue', JSON.dump(job))
      end

      def pop
        _queue, job = @connection.brpop('luffy:queue')
        payload = JSON.parse(job, symbolize_names: true)
        payload[:worker] = Object.const_get(payload[:worker])
        payload
      end
    end
  end
end
