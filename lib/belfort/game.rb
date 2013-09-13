
module Belfort
  class Game
    attr_reader :phase, :players, :round

    def initialize(opts = {})
      player_count = opts[:players].nil? ? opts.fetch(:count, 2) : opts[:players].size

      unless player_count.between?(2, 5)
        fail(ArgumentError, "Player count has to be between 2 and 5") 
      end

      @phase = ROUNDS.first
      @players = validate_players(opts.fetch(:players, default_players(player_count)))
      @round = 0
    end

    private

    def default_players(count)
      count.times.map { |n| Player.new("Player #{n + 1}") }
    end

    def validate_players(players)
      Array(players).each do |p|
        unless p.instance_of?(Belfort::Player)
          fail(ArgumentError, "Only Belfort::Players instances are allowed, received: #{p.class}")
        end
      end
    end
  end
end

