class Assessment < ActiveRecord::Base
  belongs_to :goal
  validates_presence_of :score

end
