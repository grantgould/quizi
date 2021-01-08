require "quizi/version"
require "json"
require "quizi/models/model"
require "quizi/models/api"
require "quizi/models/question"
require "quizi/models/category"
require "quizi/models/game"

module Quizi
  class Error < StandardError; end
  class Application

    def self.run
      game = Game.new(ARGV)

      game.start
    end
  end
end
