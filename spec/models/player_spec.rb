
require 'spec_helper'

describe Belfort::Player do
  context "just initialized" do
    let(:name) { "Jinx" }
    subject { described_class.new(name) }

    its(:wood)  { should eql(1) }
    its(:stone) { should eql(1) }
    its(:metal) { should eql(1) }
    its(:gold)  { should eql(5) }
    its(:name)  { should eql("Jinx") }
  end
end

