
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
      check_location(location)
      !(@places.fetch(location))
    end

    # Purchase a plot of land for a player, and mark it owned by them.
    #
    # @param [Symbol] location Location that will be purchased.
    # @param [Belfort::Player] player The new owner of the location.
    def purchase(location, player)
      check_location(location)
      fail(ArgumentError, "Location already taken") unless available?(location)
      @places[location] = player
    end

    private

    # Check to see whether a location is a valid area or not.
    #
    # @param [Symbol] location A named location to be checked.
    def check_location(location)
      fail(ArgumentError, "Invalid location") unless SECTION_AREAS.include?(location)
    end
  end
end

