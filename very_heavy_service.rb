require './luffy/worker'

class VeryHeavyService
  include Luffy::Worker

  def perform(sleep_sec)
    sleep sleep_sec
    puts "This task loading #{sleep_sec} seconds"
  end
end
