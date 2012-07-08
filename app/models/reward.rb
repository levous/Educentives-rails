class Reward < ActiveRecord::Base
  belongs_to :plan
  has_one :reward_photo
end
