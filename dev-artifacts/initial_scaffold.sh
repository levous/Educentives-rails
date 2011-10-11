rails new educentives
# Initial scaffold for Educentives
cd source
# Goal - the thing we're striving to accomplish
#  has_many :milestones 
#  belongs_to :plan
#  has_one :reward, :through => :plan
rails generate scaffold Goal title:string long_description:text point_value:integer plan_id:integer target_datetime:datetime completed_at:datetime

# Milestone - intermediate goals that take us toward our goal
#  belongs_to :goal
rails generate scaffold Milestone title:string long_description:text point_value:integer goal_id:integer target_datetime:datetime completed_at:datetime

# Reward - the incentive, the carrot
#  belongs_to :plan
#  has_one :goal, :through => :plan
#  has_one :reward_photo
rails generate scaffold Reward title:string point_value:integer plan_id:integer

# RewardPhoto - a pic of the incentive
#  belongs_to :reward
rails generate scaffold RewardPhoto title:string url_path:integer reward_id:integer

# Person - could be a student, a teacher, a patron, or any combination of
#  title is what most people will call this person.  A teacher may be "Mrs. Fletcher" while a student might be "Mike P."
#  has_one :student
#  has_one :teacher
#  has_many :advocacies
#  has_many :sponsorships
rails generate scaffold Person first_name:string last_name:string middle_name:string title:string

# Student - someone pursuing goals
#  has_many :plans 
#  has_many :student_groups 
#  belongs_to :person
rails generate scaffold Student title:string person_id:integer

# StudentGroup - a class, essentially, but we can't call it class in code.  
#  has_many :students
#  belongs_to :teacher
rails generate scaffold StudentGroup title:string teacher_id:integer

# Teacher - The teacher of a student 
#  title is what the student calls the teacher, ie: Mrs. McGillicuty
#  has_many :studentGroups
#  has_many :plans
#  belongs_to :person
rails generate scaffold Teacher title:string person_id:integer

# Sponsorship - The patron supporter of a student's plan.  The person providing the reward upon success.  
#  title is what the student calls the patron, ie: Mr. Moneybags
#  belongs_to :person
#  has_one :plan
rails generate scaffold Sponsorship title:string person_id:integer

# Plan - the goal and intermediate milestones to be completed by a target date as agreed upon by the student, their patron and the teacher
#  has_one :goal
#  has_one :reward
#  belongs_to :student
#  belongs_to :teacher
#  belongs_to :sponsorship 
rails generate scaffold Plan targetDate:date title:string student_id:integer teacher_id:integer sponsorship_id:integer

# Advocacy - someone looking out for and supporting a student.  Not the provider of the Reward
#  relationship might be mother, father, brother, uncle, neighbor, etc
#  belongs_to :person
#  has_one :student
rails generate scaffold Advocacy relationship:string person_id:integer

rake db:migrate









