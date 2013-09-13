
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
      @wood = 1
      @stone = 1
      @metal = 1
      @gold = 5
    end
  end
end
