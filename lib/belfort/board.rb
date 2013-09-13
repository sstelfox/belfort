
module Belfort
  # A copy of the current game's board and all of the sections.
  class Board
    attr_reader :sections

    # Setup the board with a bunch of sections.
    def initialize
      @sections = default_sections
    end

    # Checks to see if the place within a particular area is available for
    # purchase.
    #
    # @param [Fixnum] section The section number 1-5
    # @param [Symbol] place The name of the place to check for availability.
    #
    # @returns [Boolean] Whether the space is available
    def available?(section, place)
      @sections[(section - 1)].available?(place)
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

