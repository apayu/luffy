class VeryHeavyService
  def initialize(sleep_sec)
    @sleep_sec = sleep_sec
  end

  def perform
    sleep @sleep_sec
    puts "This task loading #{@sleep_sec} seconds"
  end
end
