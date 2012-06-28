require 'spec_helper'

describe Plan do
  it "is instantiated with appropriate defaults" do
    plan =  Plan.new
    plan.should be_an_instance_of(Plan)
    plan.reward.should be_an_instance_of(Reward)
  end
end

