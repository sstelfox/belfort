
module Belfort
  class Board
    attr_reader :sections

    def initialize
      @sections = 5.times.map { Belfort::Section.new }
    end
  end
end

