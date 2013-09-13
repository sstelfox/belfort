
module Belfort
  class Player
    attr_reader :wood, :stone, :metal, :gold, :name

    def initialize(name)
      @name = name
      @wood = 1
      @stone = 1
      @metal = 1
      @gold = 5
    end
  end
end
