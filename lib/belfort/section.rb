
module Belfort
  # A representation of one the five board sections. Keeps track of the board as
  # well so it can check on the availability of gatehouses.
  class Section

    # Setup an empty section of the board.
    def initialize(board)
      @places = SECTION_AREAS.zip([nil])
    end
  end
end

