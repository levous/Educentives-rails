class Plan < ActiveRecord::Base
  belongs_to :student
  has_one :goal, :dependent => :delete
  has_one :reward, :dependent => :delete
  after_initialize :default_values

  private
    def default_values
      self.reward ||= Reward.new
    end

end
