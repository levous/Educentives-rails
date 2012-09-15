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
  
  it "should calculate percent complete upon save" do
    goal = Goal.new(:title => 'whateva')
    goal.point_value = 200
    m1 = Milestone.new
    m1.point_value = 100
    m2 = Milestone.new
    m2.point_value = 100

    goal.milestones << [m1,m2]
    goal.save

    goal.points_complete = 0
    goal.points_complete.should == 0

    m1.completed_at = DateTime.now
    m1.save

    goal.save

    goal.points_complete.should == 100

    goal.percent_complete.should == 50

    m2.completed_at = DateTime.now
    m2.save

    goal.save

    goal.points_complete.should == 200
    goal.percent_complete.should == 100

  end

  it "should calculate 0% when no points are assigned" do
    goal = Goal.new(:title => 'whateva')
    m1 = Milestone.new
    m2 = Milestone.new

    goal.milestones << [m1,m2]
    goal.save

    goal.points_complete = 0
    goal.points_complete.should == 0

    m1.completed_at = DateTime.now
    m1.save

    goal.save

    goal.points_complete.should == 0

    goal.percent_complete.should == 0

  
  end
end
