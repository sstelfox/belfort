
require 'spec_helper'

describe Belfort::Game do
  context "#initialize" do
    it "should raise an error with too few players" do
      expect { described_class.new(1) }.to raise_error(ArgumentError)
    end

    it "should raise an error with too many players" do
      expect { described_class.new(6) }.to raise_error(ArgumentError)
    end
  end

  context "#players" do
    subject { described_class.new(player_count) }

    context "two players" do
      let(:player_count) { 2 }
      it { expect(subject.players.size).to eql(2) }
    end

    context "two players" do
      let(:player_count) { 3 }
      it { expect(subject.players.size).to eql(3) }
    end

    context "two players" do
      let(:player_count) { 4 }
      it { expect(subject.players.size).to eql(4) }
    end

    context "two players" do
      let(:player_count) { 5 }
      it { expect(subject.players.size).to eql(5) }
    end
  end
end

