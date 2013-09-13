
module Belfort

  # A representation of the current game state.
  class Game
    attr_reader :phase, :players, :round

    # Initializer for the Game class.
    #
    # @param [Hash] opts The options to initialize a game with.
    # @option opts [Fixnum] :count The number of players to start a game with.
    #   If players are provided they will take precedence over this option. This
    #   should be between 2 and 5.
    # @option opts [Array<Belfort::Player, String>] A list of player's names as
    #   Strings or existing Belfort::Player instances. There should be between 2
    #   and 5 players.
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
      Array(players).map do |p|
        next p if p.instance_of?(Belfort::Player)
        next Belfort::Player.new(p) if p.instance_of?(String)

        fail(ArgumentError, "Only Belfort::Players instances are allowed, received: #{p.class}")
      end
    end
  end
end

