
module Belfort
  class Game
    attr_reader :phase, :players, :round

    def initialize(options = {})
      player_count = options.fetch(:count, 2)

      unless player_count.between?(2, 5)
        fail(ArgumentError, "Player count has to be between 2 and 5") 
      end

      @phase = ROUNDS.first
      @players = options.fetch(:players, default_players(player_count))
      @round = 0
    end

    private

    def default_players(count)
      count.times.map { |n| Player.new("Player #{n + 1}") }
    end
  end
end

