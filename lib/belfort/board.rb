
module Belfort
  # A copy of the current game's board and all of the sections.
  class Board
    attr_reader :sections

    # Setup the board with a bunch of sections.
    def initialize
      @sections = default_sections
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

