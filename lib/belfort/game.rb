
module Belfort
  # A representation of the current game state.
  class Game
    attr_reader :board, :phase, :players, :round, :guilds

    # Initializer for the Game class.
    #
    # @param [Hash] opts The options to initialize a game with.
    # @option opts [Fixnum] :count The number of players to start a game with.
    #   If players are provided they will take precedence over this option. This
    #   should be between 2 and 5 and defaults to 2 if neither this nor the
    #   players array is provided.
    # @option opts [Array<Belfort::Player, String>] :players A list of player's
    #   names as Strings or existing Belfort::Player instances. There should be
    #   between 2 and 5 players.
    # @option opts [Symbol] :difficulty The level of difficulty for the game,
    #   valid options are :beginner, :normal, and :advanced.
    # @raise [ArgumentError] If an invalid number of players, either through the
    #   count variable or through a provided players array.
    # @return [void]
    def initialize(opts = {})
      player_count = opts[:players].nil? ? opts.fetch(:count, 2) : opts[:players].size

      unless player_count.between?(2, 5)
        fail(ArgumentError, "Player count has to be between 2 and 5") 
      end

      @board = Belfort::Board.new
      @phase = ROUNDS.first
      @round = 0

      @guilds = generate_guilds(opts.fetch(:difficulty, :beginner))
      @players = generate_players(opts.fetch(:players, default_players(player_count)))
    end

    private

    # Given a number, this will generate that many Belfort::Players with numeric
    # names such as 'Player 1'.
    #
    # @param [Fixnum] count The number of players to generate
    # @return [Array<Belfort::Player>] The generated players
    def default_players(count)
      count.times.map { |n| Belfort::Player.new("Player #{n + 1}") }
    end

    # Based on the provided difficulty select the guilds that will exist in
    # play.
    #
    # @param [Symbol] difficulty :beginner, :normal, or :advanced
    # @raise [ArgumentError] if an invalid difficulty is provided.
    # @return [void]
    def generate_guilds(difficulty)
      case difficulty
      when :beginner
        @guilds = Belfort::RESOURCE_GUILDS.sample(3)
        @guilds += Belfort::BASIC_GUILDS.sample(2)
      when :normal
        @guilds = Belfort::RESOURCE_GUILDS.sample(1)
        @guilds += Belfort::BASIC_GUILDS.sample(2)
        @guilds += Belfort::INTERACTIVE_GUILDS.sample(2)
      when :advanced
        @guilds = Belfort::ALL_GUILDS.sample(5)
      else
        fail(ArgumentError, "Invalid game difficulty provided")
      end

      # Ensure we're not ordered in anyway
      @guilds.shuffle!
    end

    # Validate that all of the inputs
    #
    # @param [Array<String, Belfort::Player>] players A list of incoming players
    #   to be validated.
    # @raise [ArgumentError] if an invalid value for a player is provided within
    #   the list.
    # @return [Array<Belfort::Player>] 2-5 players for the game
    def generate_players(players)
      Array(players).map do |p|
        next p.reset if p.instance_of?(Belfort::Player)
        next Belfort::Player.new(p) if p.instance_of?(String)
        fail(ArgumentError, "Only Belfort::Players, and String instances are allowed, received: #{p.class}")
      end
    end
  end
end

