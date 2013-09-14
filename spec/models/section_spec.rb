
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

    it "should be aware of neighboring sections gatehouse availablilty" do
      board.should_receive(:gatehouse_available?).with(subject, :left).and_return(true)
      board.should_receive(:gatehouse_available?).with(subject, :right).and_return(false)

      subject.available?(:gatehouse_left).should be_true
      subject.available?(:gatehouse_right).should be_false
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

  context "#set_guild" do
    it "should assign the provided guild to the section" do
      guild = :bandits

      subject.set_guild(guild)
      subject.guild[:name].should eq(guild)
    end

    it "should raise an error if the guild isn't real" do
      expect { subject.set_guild(:church) }.to raise_error(ArgumentError)
    end

    it "should raise an error if the guild is already set on the section" do
      guild = :wizards

      subject.set_guild(guild)
      expect { subject.set_guild(guild) }.to raise_error(ArgumentError)
    end
  end
end

