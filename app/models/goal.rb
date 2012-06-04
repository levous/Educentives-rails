class Goal < ActiveRecord::Base
  has_many :milestones
  belongs_to :plan
 
  scope :by_plan,
    lambda { |plan_id| where(plan_id: plan_id)}
  scope :by_person_as_student,
    lambda { |person| 
    { 
      :joins      => "JOIN plans p ON p.id = plan_id JOIN students s ON s.id = p.student_id, people pp ON pp.id = s.person_id", 
      :conditions => "pp.id = #{person.id}"  
    } 
  } 
end
