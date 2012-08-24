require 'spec_helper'

describe Goal do 
  it "can be instantiated" do
    Goal.new.should be_an_instance_of(Goal)
  end

  it "can be saved successfullysh" do
    goal = Goal.create(:title => "test")
    goal.should be_persisted
    goal.plan.should be_an_instance_of(Plan)
    goal.plan.title.should == goal.title

  end

  it "should create a student association for user" do
    goal = Goal.new
    goal.set_goal_user User.new(:person => Person.new)
    goal.plan.student.should be_an_instance_of(Student)
  end
end
