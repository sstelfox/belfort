
module Belfort
  class Game
    attr_reader :players

    def initialize(player_count)
      @players = Array.new(player_count)
    end
  end
end

