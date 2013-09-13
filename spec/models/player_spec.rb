
require 'spec_helper'

describe Belfort::Player do
  context "just initialized" do
    its(:wood)  { should eql(1) }
    its(:stone) { should eql(1) }
    its(:metal) { should eql(1) }
    its(:gold)  { should eql(5) }
  end
end

