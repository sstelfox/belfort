
require 'spec_helper'

describe Belfort::Player do
  let(:name) { "Jinx" }
  subject { described_class.new(name) }

  context "just initialized" do
    its(:dwarves) { should eql(3) }
    its(:elves)   { should eql(3) }
    its(:gnomes)  { should eql(0) }
    its(:gold)    { should eql(5) }
    its(:metal)   { should eql(1) }
    its(:name)    { should eql("Jinx") }
    its(:stone)   { should eql(1) }
    its(:wood)    { should eql(1) }

    its(:properties)  { should eql(12) }
  end

  it "should allow for updating names" do
    new_name = "John"
    expect { subject.name = new_name }.to change { subject.name }.from(name).to(new_name)
  end
end

