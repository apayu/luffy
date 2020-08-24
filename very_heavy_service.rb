require_relative './luffy/luffy'

# Luffy.backend = Queue.new
# Luffy.backend = Luffy::Backend::Redis.new
# Luffy::Processor.start(5)

class VeryHeavyService
  include Luffy::Worker

  def perform(sleep_sec)
    sleep sleep_sec
    puts "[#{Thread.current.name}] This task loading #{sleep_sec} seconds"
  end
end
