class Reward < ActiveRecord::Base
  belongs_to :plan
  has_one :reward_photo, :dependent => :destroy
  accepts_nested_attributes_for :reward_photo
  before_save :ensure_reward_photo

  def ensure_reward_photo
    self.build_reward_photo if self.reward_photo.nil?
  end
end
