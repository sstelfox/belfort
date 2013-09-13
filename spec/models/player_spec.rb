
require 'spec_helper'

describe Belfort::Player do
  let(:name) { "Jinx" }
  subject { described_class.new(name) }

  context "just initialized" do
    its(:wood)  { should eql(1) }
    its(:stone) { should eql(1) }
    its(:metal) { should eql(1) }
    its(:gold)  { should eql(5) }
    its(:name)  { should eql("Jinx") }
  end

  it "should allow for updating names" do
    new_name = "John"
    expect { subject.name = new_name}.to change { subject.name }.from(name).to(new_name)
  end
end

