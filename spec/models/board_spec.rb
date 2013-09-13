
require 'spec_helper'

describe Belfort::Board do
  it { should have(5).sections }

  it "should be made up of Belfort:Sections" do
    subject.sections.each { |s| s.should be_instance_of(Belfort::Section) }
  end

  it "should proxy location checks to it's sections" do
    pending
  end

  it "should proxy purchases to it's sections" do
    pending
  end

  it "should allow checking gatehouse availability for section's neighbors" do
    pending
  end
end

