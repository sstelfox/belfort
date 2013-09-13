
module Belfort
  # An individual player within the game.
  class Player
    attr_reader :wood, :stone, :metal, :gold
    attr_accessor :name

    # Setup the player with the default state and make set their provided name.
    #
    # @param [String] name The name of the player
    def initialize(name)
      self.name = name
      reset
    end

    # Reset's the player back to the initial state. It returns self to allow for
    # chaining and using 'next' from within map statements.
    #
    # @return [self] The current instance
    def reset
      @wood = 1
      @stone = 1
      @metal = 1
      @gold = 5
      self
    end
  end
end
