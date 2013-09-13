
module Belfort
  # A representation of one the five board sections. Keeps track of the board as
  # well so it can check on the availability of gatehouses.
  class Section

    # Setup an empty section of the board.
    #
    # @param [Belfort::Board] board The board this section belongs too.
    def initialize(board)
      @board = board
      @places = Hash[SECTION_AREAS.zip([nil])]
    end

    # Check to see whether a particular location is available or not.
    #
    # @param [Symbol] location A named location to be checked.
    def available?(location)
      fail(ArgumentError, "Invalid location") unless SECTION_AREAS.include?(location)
      !(@places.fetch(location))
    end
  end
end

