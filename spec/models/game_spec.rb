
require 'spec_helper'

describe Belfort::Game do
  subject { described_class.new(player_count) }

  context "#initialize" do
    it "should raise an error with too few players" do
      expect { described_class.new(1) }.to raise_error(ArgumentError)
    end

    it "should raise an error with too many players" do
      expect { described_class.new(6) }.to raise_error(ArgumentError)
    end
  end

  context "with two players" do
    let(:player_count) { 2 }

    it { should have(2).players }
    it "should generate Belfort::Players" do
      subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
    end

    it "should have 'Player 1' for the first player's name" do
      subject.players.first.name.should eql("Player 1")
    end

    it "should have 'Player 2' for the last player's name" do
      subject.players.last.name.should eql("Player 2")
    end
  end

  context "with three players" do
    let(:player_count) { 3 }

    it { should have(3).players }
    it "should generate Belfort::Players" do
      subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
    end

    it "should have 'Player 1' for the first player's name" do
      subject.players.first.name.should eql("Player 1")
    end

    it "should have 'Player 3' for the last player's name" do
      subject.players.last.name.should eql("Player 3")
    end
  end

  context "with four players" do
    let(:player_count) { 4 }

    it { should have(4).players }
    it "should generate Belfort::Players" do
      subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
    end

    it "should have 'Player 1' for the first player's name" do
      subject.players.first.name.should eql("Player 1")
    end

    it "should have 'Player 4' for the last player's name" do
      subject.players.last.name.should eql("Player 4")
    end
  end

  context "with five players" do
    let(:player_count) { 5 }

    it { should have(5).players }
    it "should generate Belfort::Players" do
      subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
    end

    it "should have 'Player 1' for the first player's name" do
      subject.players.first.name.should eql("Player 1")
    end

    it "should have 'Player 5' for the last player's name" do
      subject.players.last.name.should eql("Player 5")
    end
  end
end

