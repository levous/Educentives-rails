class AddImageToRewardPhotos < ActiveRecord::Migration
  def change
    add_column :reward_photos, :image, :string
    remove_column :reward_photos, :url_path
  end
end
