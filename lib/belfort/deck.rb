
module Belfort
  # A class that holds the current state of the deck
  class Deck
    attr_reader :board

    # Initialize a new card deck thats all shuffled up.
    #
    # @return [void]
    def initialize
      @deck = (CARD_TYPES * 5).shuffle
      @board = @deck.shift(3)
    end

    # Returns the available number of cards left that can be drawn. This
    # includes any available in the board as well.
    #
    # @return [Fixnum] The number of cards available
    def available_cards
      (@deck.size + board.size)
    end

    # Take and replenish a card from the board.
    #
    # @param [Fixnum] num The number in the board 
    # @raise [ArgumentError] Invalid card identifier
    # @return [Symbol] A card
    def take_board_card(num)
      unless num.between?(1, 3)
        fail(ArgumentError, "Can't take card #{num} only 1-3")
      end

      board.unshift(take_card) && board.delete_at(num)
    end

    # Take a card from the deck and return it.
    #
    # @return [Symbol] a card identifier
    def take_card
      @deck.shift
    end
  end
end
