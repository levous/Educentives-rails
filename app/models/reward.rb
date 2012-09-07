class Reward < ActiveRecord::Base
  belongs_to :plan
  has_one :reward_photo, :dependent => :destroy
  accepts_nested_attributes_for :reward_photo
  #attr_accessible :reward_photo
end
