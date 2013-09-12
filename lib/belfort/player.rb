
module Belfort
  class Player
    attr_accessor :wood, :stone, :metal, :gold

    def initialize
      self.wood = 1
      self.stone = 1
      self.metal = 1
      self.gold = 5
    end
  end
end
