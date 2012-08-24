class Goal < ActiveRecord::Base
  has_many :milestones, :dependent => :delete_all
  belongs_to :plan
  validates_presence_of :title

  before_save :ensure_plan
  
  def ensure_plan
    #default the goal with an empty plan
    self.plan = Plan.new(:title => self.title) if self.plan.nil?
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
end

