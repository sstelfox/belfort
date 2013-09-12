
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
    its(:players) { should be_kind_of(Belfort::Player) }
  end

  context "with three players" do
    let(:player_count) { 3 }

    it { should have(3).players }
    its(:players) { should be_kind_of(Belfort::Player) }
  end

  context "with four players" do
    let(:player_count) { 4 }

    it { should have(4).players }
    its(:players) { should be_kind_of(Belfort::Player) }
  end

  context "with five players" do
    let(:player_count) { 5 }

    it { should have(5).players }
    its(:players) { should be_kind_of(Belfort::Player) }
  end
end

