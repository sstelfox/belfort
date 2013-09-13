
module Belfort
  # An individual player within the game.
  class Player
    attr_reader :wood, :stone, :metal, :gold
    attr_accessor :name

    # Setup the player with the default state and make set their provided name.
    #
    # @param [String] name The name of the player
    # @return [void]
    def initialize(name)
      self.name = name
      reset
    end

    # Reset's the player back to the initial state. It returns self to allow for
    # chaining and using 'next' from within map statements.
    #
    # @return [self] The current instance
    def reset
      @wood, @stone, @metal, @gold = [1, 1, 1, 5]
      self
    end
  end
end
