
require 'spec_helper'

describe Belfort::Section do
  let(:board) { double("Belfort::Board") }
  subject { described_class.new(board) }

  it "should be able to report on available locations" do
    subject.available?(:bank).should be_true
  end
end

