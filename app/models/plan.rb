class Plan < ActiveRecord::Base
  belongs_to :student
  has_one :goal
end
