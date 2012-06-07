class Milestone < ActiveRecord::Base
  belongs_to :goal
  def completed?
    completed_at.present?
  end
end
