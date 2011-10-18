class Goal < ActiveRecord::Base
  has_many :milestones
  belongs_to :plan
 
end
