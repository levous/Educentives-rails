class Student < ActiveRecord::Base
  belongs_to :person 
  has_many :plans
end
