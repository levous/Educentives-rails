module RewardPhotosHelper
  def reward_photo_linked_image_tag(reward_photo)
    if ! (reward_photo.blank? || reward_photo.image.blank? || reward_photo.title.blank?)
      image_tag(reward_photo.image, :alt => reward_photo.title) 
    end
  end
end
