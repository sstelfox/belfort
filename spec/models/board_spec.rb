
require 'spec_helper'

describe Belfort::Board do
  subject { described_class.new }
  it { should have(5).sections }

  it "should be made up of Belfort:Sections" do
    subject.sections.each { |s| s.should be_instance_of(Belfort::Section) }
  end

  context "#available?" do
    it "should raise an error when section ID is too low" do
      expect { subject.available?(0, :tower) }.to raise_error(ArgumentError)
    end

    it "should raise an error when section ID is too high" do
      expect { subject.available?(6, :library) }.to raise_error(ArgumentError)
    end
  end

  context "#gatehouse_available?" do
    it "should raise an error for an invalid direction" do
      expect { subject.gatehouse_available?(double("Subject"), :up) }.to raise_error(ArgumentError)
    end

    it "should raise an error for an invalid section" do
      expect { subject.gatehouse_available?("Fake Section", :left) }.to raise_error(ArgumentError)
    end
  end

  context "#assign_guilds" do
    it "should raise an error with too few guilds" do
      guilds = [ :merchants, :librarians, :miners ]
      expect { subject.assign_guilds(guilds) }.to raise_error(ArgumentError)
    end

    it "should raise an error with too many guilds" do
      guilds = [ :merchants, :librarians, :miners, :thieves, :bankers, :masons ]
      expect { subject.assign_guilds(guilds) }.to raise_error(ArgumentError)
    end
  end

  context "with section mocks" do
    let(:first)     { double("first section") }
    let(:second)    { double("second section") }
    let(:third)     { double("third section") }
    let(:fourth)    { double("fourth section") }
    let(:fifth)     { double("fifth section") }
    let(:sections)  { [first, second, third, fourth, fifth] }

    before do
      Belfort::Board.any_instance.stub(:default_sections).and_return(sections)
    end

    it "should proxy location checks to it's sections" do
      first.should_receive(:available?).with(:pub).and_return(true)
      subject.available?(1, :pub)
    end

    it "should proxy purchases to it's sections" do
      third.should_receive(:purchase).with(:bank)
      subject.purchase(3, :bank)
    end

    context "#gatehouse_available?" do
      it "should allow checking availability of a section neighbor's gatehouses" do
        second.should_receive(:available?).with(:gatehouse_right).and_return(true)
        fourth.should_receive(:available?).with(:gatehouse_left).and_return(false)

        subject.gatehouse_available?(third, :left).should be_true
        subject.gatehouse_available?(third, :right).should be_false
      end

      it "should wrap around from the first section to the last" do
        fifth.should_receive(:available?).with(:gatehouse_right).and_return(true)
        first.should_receive(:available?).with(:gatehouse_left).and_return(false)

        subject.gatehouse_available?(first, :left).should be_true
        subject.gatehouse_available?(fifth, :right).should be_false
      end
    end

    context "#assign_guilds" do
      it "should assign the guilds to the respective sections" do
        guild_list = [ :merchants, :bankers, :thieves, :masons, :miners ]

        first.should_receive(:set_guild).with(guild_list[0])
        second.should_receive(:set_guild).with(guild_list[1])
        third.should_receive(:set_guild).with(guild_list[2])
        fourth.should_receive(:set_guild).with(guild_list[3])
        fifth.should_receive(:set_guild).with(guild_list[4])

        subject.assign_guilds(guild_list)
      end
    end
  end
end

