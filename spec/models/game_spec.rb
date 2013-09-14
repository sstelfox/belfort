
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

    it "should select five guilds" do
      subject.should have(5).guilds
    end

    it "should default to 2 players" do
      subject.should have(2).players
    end

    it "should default to the first turn" do
      subject.turn.should eq(1)
    end

    context "#current_player" do
      it "should provide a current player" do
        subject.current_player.should be_kind_of(Belfort::Player)
      end
    end

    context "#end_turn" do
      it "should advance the turn count" do
        pending
      end

      it "should should change the current player" do
        pending
      end

      it "should advanced the phase after the last player ends their turn" do
        pending
      end

      it "should reset the turn count once a phase has been advanced" do
        pending
      end
    end

    context "game difficulty: " do
      subject { described_class.new(difficulty: difficulty) }

      it "should raise an error with an invalid difficulty" do
        difficulty = :invalid
        expect { subject }.to raise_error
      end

      context "Beginner" do
        let(:difficulty) { :beginner }

        it "should have three resource guilds" do
          (subject.guilds & Belfort::RESOURCE_GUILDS).size.should eq(3)
        end

        it "should have two basic guilds" do
          (subject.guilds & Belfort::BASIC_GUILDS).size.should eq(2)
        end

        it "should have no interactive guilds" do
          (subject.guilds & Belfort::INTERACTIVE_GUILDS).should be_empty
        end
      end

      context "Normal" do
        let(:difficulty) { :normal }

        it "should have one resource guild" do
          (subject.guilds & Belfort::RESOURCE_GUILDS).size.should eq(1)
        end

        it "should have two basic guilds" do
          (subject.guilds & Belfort::BASIC_GUILDS).size.should eq(2)
        end

        it "should have two interactive guilds" do
          (subject.guilds & Belfort::INTERACTIVE_GUILDS).size.should eq(2)
        end
      end

      context "Advanced" do
        let(:difficulty) { :advanced }

        it "should have five guilds from any category" do
          (subject.guilds & Belfort::ALL_GUILDS).size.should eq(5)
        end
      end
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

      context "Mixed" do
        let(:player_list) do
          [ Belfort::Player.new("1"), "Phil" ]
        end

        it "should accept provided players" do
          subject.should have(2).players
        end
      end
    end
  end

  context "with players:" do
    subject { described_class.new(count: player_count) }

    context "two" do
      let(:player_count) { 2 }

      it { should have(2).players }

      it "should start with 9 available gnomes" do
        subject.available_gnomes.should eq(9)
      end

      it "should generate Belfort::Players" do
        subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
      end

      it "should have 'Player 1' for the first player's name" do
        subject.players.first.name.should eql("Player 1")
      end

      it "should have 'Player 2' for the last player's name" do
        subject.players.last.name.should eql("Player 2")
      end

      it "should have generated a player order" do
        subject.player_order.size.should eq(2)
      end
    end

    context "three" do
      let(:player_count) { 3 }

      it { should have(3).players }

      it "should start with 14 available gnomes" do
        subject.available_gnomes.should eq(14)
      end

      it "should generate Belfort::Players" do
        subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
      end

      it "should have 'Player 1' for the first player's name" do
        subject.players.first.name.should eql("Player 1")
      end

      it "should have 'Player 3' for the last player's name" do
        subject.players.last.name.should eql("Player 3")
      end

      it "should have generated a player order" do
        subject.player_order.size.should eq(3)
      end
    end

    context "four" do
      let(:player_count) { 4 }

      it { should have(4).players }

      it "should start with 18 available gnomes" do
        subject.available_gnomes.should eq(18)
      end

      it "should generate Belfort::Players" do
        subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
      end

      it "should have 'Player 1' for the first player's name" do
        subject.players.first.name.should eql("Player 1")
      end

      it "should have 'Player 4' for the last player's name" do
        subject.players.last.name.should eql("Player 4")
      end

      it "should have generated a player order" do
        subject.player_order.size.should eq(4)
      end
    end

    context "five" do
      let(:player_count) { 5 }

      it { should have(5).players }

      it "should start with 22 available gnomes" do
        subject.available_gnomes.should eq(22)
      end

      it "should generate Belfort::Players" do
        subject.players.each { |p| p.should be_instance_of(Belfort::Player) }
      end

      it "should have 'Player 1' for the first player's name" do
        subject.players.first.name.should eql("Player 1")
      end

      it "should have 'Player 5' for the last player's name" do
        subject.players.last.name.should eql("Player 5")
      end

      it "should have generated a player order" do
        subject.player_order.size.should eq(5)
      end
    end
  end
end

