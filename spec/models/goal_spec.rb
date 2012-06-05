require 'spec_helper'

describe Goal do 
  it "can be instantiated" do
    Goal.new.should be_an_instance_of(Goal)
  end

  it "can be saved successfullysh" do
    Goal.create.should be_persisted
  end
end
