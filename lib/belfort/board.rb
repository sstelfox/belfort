
module Belfort
  # A copy of the current game's board and all of the sections.
  class Board
    attr_reader :sections

    # Setup the board with a bunch of sections.
    #
    # @return [void]
    def initialize
      @sections = default_sections
    end

    # Checks to see if the place within a particular area is available for
    # purchase.
    #
    # @param [Fixnum] section The section number 1-5
    # @param [Symbol] place The name of the place to check for availability.
    # @raise [ArgumentError] If the section is out of the valid range.
    # @return [Boolean] Whether the space is available
    def available?(section, place)
      fail(ArgumentError, "Invalid section identifer") unless section.between?(1, 5)
      sections[(section - 1)].available?(place)
    end

    # Purchase a particular location on an individual section.
    #
    # @param [Fixnum] section The section number 1-5.
    # @param [Symbol] place The name of the place to check for availability.
    # @raise [ArgumentError] If the section is out of the valid range.
    # @return [void]
    def purchase(section, place)
      fail(ArgumentError, "Invalid section identifer") unless section.between?(1, 5)
      sections[(section - 1)].purchase(place)
    end

    # This is used to check and see if the opposite side of a gatehouse is
    # available. This should only be called from a section that is a child of
    # this board.
    #
    # @param [Belfort::Section] section A child section of this board.
    # @param [Symbol] direction Either :left or :right the direction from the
    #   provided section that will be checked.
    # @raise [ArgumentError] If the section isn't a child of this board, or the
    #   direction is invalid.
    # @return [Boolean] Whether the gatehouse is available in the neighboring
    #   section in the direction provided.
    def gatehouse_available?(section, direction)
      fail(ArgumentError, "Not a real section of this board.") unless sections.include?(section)
      fail(ArgumentError, "Direction is invalid.") unless [:left, :right].include?(direction)

      section_index = sections.index(section)
      section_index += (direction == :left) ? -1 : 1
      section_index = section_index % 5

      location = (direction == :left) ? :gatehouse_right : :gatehouse_left

      sections[section_index].available?(location)
    end
    
    private

    # Handle the creation of the various board sections.
    #
    # @return [Array<Belfort::Section>] the built up sections.
    def default_sections
      5.times.map { Belfort::Section.new(self) }
    end
  end
end

