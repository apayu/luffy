module Luffy
  module Worker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def perform_now(*args)
        new.perform(*args)
      end

      def perform_async(*args)
        Thread.new { new.perform(*args) }
      end

      def perform_queue(*args)
        Luffy.backend.push(worker: self, args: args)
      end
    end

    def perform(*)
      raise NotImplementedError
    end
  end
end
