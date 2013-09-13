
module Belfort
  # A copy of the current game's board and all of the sections.
  class Board
    attr_reader :sections

    # Setup the board with a bunch of sections.
    def initialize
      @sections = 5.times.map { Belfort::Section.new(self) }
    end
  end
end

