
require 'spec_helper'

describe Belfort::Game do
  subject { described_class.new(player_count) }

  context "#players" do
    let(:player_count) { 2 }

    it { should have(2).players }
  end
end

