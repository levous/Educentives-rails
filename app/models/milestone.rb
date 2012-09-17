class Milestone < ActiveRecord::Base
  belongs_to :goal
  acts_as_list
  def completed?
    completed_at.present?
  end
end
