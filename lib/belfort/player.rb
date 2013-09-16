
module Belfort
  # An individual player within the game.
  class Player
    attr_accessor :name
    attr_reader :dwarves, :elves, :gnomes, :gold, :metal, :properties, :score,
      :stone, :wood

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
      @gold, @metal, @stone, @wood = [5, 1, 1, 1]
      @dwarves, @elves, @gnomes = [3, 3, 0]
      @properties, @score = [12, 0]

      self
    end
  end
end
