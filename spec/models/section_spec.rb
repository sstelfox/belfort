
require 'spec_helper'

describe Belfort::Section do
  let(:board) { double("Belfort::Board") }
  let(:player) { double("Belfort::Player") }

  subject { described_class.new(board) }

  context "#available?" do
    it "should be able to report on available locations" do
      subject.available?(:bank).should be_true
    end

    it "should raise an error on invalid locations" do
      expect { subject.available?(:beach) }.to raise_error(ArgumentError)
    end
  end

  context "#purchase" do
    it "should allow a user to purchase an unowned plot" do
      subject.available?(:gardens).should be_true
      subject.purchase(:gardens, player)
      subject.available?(:gardens).should be_false
    end

    it "should raise an error on invalid locations" do
      expect { subject.purchase(:mall) }.to raise_error
    end

    it "should raise an error if a plot is already taken" do
      subject.purchase(:gardens, player)
      subject.available?(:gardens).should be_false
      expect { subject.purchase(:gardens, player) }.to raise_error(ArgumentError)
    end
  end
end

