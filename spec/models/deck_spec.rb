
require 'spec_helper'

describe Belfort::Deck do
  it "should start with 50 cards" do
    subject.available_cards.should eq(50)
  end

  it "should have three cards in the board" do
    subject.should have(3).board
  end

  it "should be made up of valid cards" do
    subject.board.each { |c| Belfort::CARD_TYPES.should include(c) }
  end

  it "should allow taking a card from the deck" do
    expect { subject.take_card }.to change { subject.available_cards }.from(50).to(49)
    Belfort::CARD_TYPES.should include(subject.take_card)
  end

  it "should allow taking a card from the board" do
    expect { subject.take_board_card(1) }.to change { subject.available_cards }.from(50).to(49)

    card = subject.board[1]
    subject.take_board_card(2).should eq(card)
  end

  it "should raise an error if take_board_card number is too small" do
    expect { subject.take_board_card(0) }.to raise_error(ArgumentError)
  end

  it "should raise an error if take_board_card number is too large" do
    expect { subject.take_board_card(4) }.to raise_error(ArgumentError)
  end
end
