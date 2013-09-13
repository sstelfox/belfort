
module Belfort
  class Player
    attr_reader :wood, :stone, :metal, :gold
    attr_accessor :name

    def initialize(name)
      self.name = name
      @wood = 1
      @stone = 1
      @metal = 1
      @gold = 5
    end
  end
end
