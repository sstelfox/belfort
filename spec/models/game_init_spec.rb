
require 'spec_helper'

describe Belfort::Game do
  context "#initialize" do
    it "should raise an error with too few players" do
      expect { described_class.new(count: 1) }.to raise_error(ArgumentError)
    end

    it "should raise an error with too many players" do
      expect { described_class.new(count: 6) }.to raise_error(ArgumentError)
    end

    it "should raise an error for invalid player types" do
      expect { described_class.new(players: [nil, 4]) }.to raise_error(ArgumentError)
    end

    it "should start out in the calendar phase" do
      subject.phase.should eql(:calendar)
    end

    it "should start out in round 0 (pre-game)" do
      subject.round.should eql(0)
    end

    it "should default to 2 players" do
      subject.should have(2).players
    end

    context "with provided" do
      subject { described_class.new(players: player_list) }

      context "Belfort::Players" do
        let(:player_list) do
          [ Belfort::Player.new("1"), Belfort::Player.new("2"),
            Belfort::Player.new("3") ]
        end

        it "should accept provided players" do
          subject.should have(3).players
        end
      end

      context "Strings" do
        let(:player_list) { %w(Jim Abby Michelle Fred) }

        it "should accept provided players" do
          subject.should have(4).players
        end
      end
    end
  end

  context "with players:" do
    subject { described_class.new(count: player_count) }

    context "two" do
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

    context "three" do
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

    context "four" do
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

    context "five" do
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
end

