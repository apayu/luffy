require_relative './worker'
require_relative './processor'
require_relative './backend/redis'

module Luffy
  def self.backend
    @backend
  end

  def self.backend=(backend)
    @backend = backend
  end
end
