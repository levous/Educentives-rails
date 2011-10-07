class CreateRewardPhotos < ActiveRecord::Migration
  def change
    create_table :reward_photos do |t|
      t.string :title
      t.integer :url_path
      t.integer :reward_id

      t.timestamps
    end
  end
end
