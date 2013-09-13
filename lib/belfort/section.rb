
module Belfort
  # A representation of one the five board sections. Keeps track of the board as
  # well so it can check on the availability of gatehouses.
  class Section
    attr_reader :board, :places

    # Setup an empty section of the board.
    #
    # @param [Belfort::Board] board The board this section belongs too.
    # @return [void]
    def initialize(board)
      @board = board
      @places = Hash[SECTION_AREAS.zip([nil])]
    end

    # Check to see whether a particular location is available or not.
    #
    # @param [Symbol] location A named location to be checked.
    # @return [Boolean] Check whether the location is currently occupied by a
    #   player.
    def available?(location)
      check_location(location)

      if [:gatehouse_left, :gatehouse_right].include?(location)
        direction = (location == :gatehouse_left) ? :left : :right
        !(places.fetch(location)) && board.gatehouse_available?(self, direction)
      else
        !(places.fetch(location))
      end
    end

    # Purchase a plot of land for a player, and mark it owned by them.
    #
    # @param [Symbol] location Location that will be purchased.
    # @param [Belfort::Player] player The new owner of the location.
    # @raise [ArgumentError] If a location is already owned and is attempted to
    #   be purchased.
    # @return [void]
    def purchase(location, player)
      check_location(location)
      fail(ArgumentError, "Location already taken") unless available?(location)
      places[location] = player
    end

    private

    # Check to see whether a location is a valid area or not.
    #
    # @param [Symbol] location A named location to be checked.
    # @raise [ArgumentError] if an invalid location is provided.
    # @return [void]
    def check_location(location)
      fail(ArgumentError, "Invalid location") unless SECTION_AREAS.include?(location)
    end
  end
end

