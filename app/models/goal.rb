class Goal < ActiveRecord::Base
  has_many :milestones, :dependent => :delete_all
  belongs_to :plan
  validates_presence_of :title

  before_save :ensure_plan, :calculate_points_complete!
  
  def ensure_plan
    #default the goal with an empty plan
    self.plan = Plan.new(:title => self.title) if self.plan.nil?
  end
  
  def calculate_points_complete!
    self.points_complete = self.milestones.sum(:point_value, :conditions => ['completed_at IS NOT NULL']) || 0
    milestone_points = self.milestones.sum(:point_value)
    if milestone_points > 0 
      self.percent_complete = ( (self.points_complete / milestone_points.to_f) * 100 )
    else
      self.percent_complete = 0.0
    end
  end
 
  scope :by_plan,
    lambda { |plan_id| where(plan_id: plan_id)}
  scope :by_person_as_student,
    lambda { |person| 
    { 
      :joins      => "JOIN plans p ON p.id = plan_id JOIN students s ON s.id = p.student_id JOIN people pp ON pp.id = s.person_id", 
      :conditions => "pp.id = #{person.id}"  
    } 
  } 

  def set_goal_user(goal_user)

    self.ensure_plan
    #user must have person or its an invalid user.  Not asserting that here
    if goal_user.person.student
      self.plan.student = goal_user.person.student
    else
      self.plan.student = Student.new(:person => goal_user.person)
    end

  end

  def nextMilestone
    milestones.find(:first, :conditions =>"completed_at IS NULL", :order => "created_at ASC")
  end
end

