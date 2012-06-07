require 'spec_helper'

describe Milestone do
  describe 'completed' do
    it "should be completed when completed date is set" do
      milestone = Milestone.new

      milestone.completed?.should == false 
      milestone.completed_at = Date.new(2008, 12, 22)
      milestone.completed?.should == true

    end
  end
end
