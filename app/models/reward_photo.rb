class RewardPhoto < ActiveRecord::Base
  attr_accessible :title, :image, :reward_id
  belongs_to :reward
  mount_uploader :image, RewardPhotoUploader

end
