
module Belfort
  class Game
    attr_reader :players

    def initialize(player_count)
      unless player_count.between?(2, 5)
        fail(ArgumentError, "Player count has to be between 2 and 5") 
      end
      @players = Array.new(player_count)
    end
  end
end

