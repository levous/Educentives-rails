class Plan < ActiveRecord::Base
  belongs_to :student
  has_one :goal
  has_one :reward
  after_initialize :default_values

  private
    def default_values
      self.reward ||= Reward.new
    end

end
