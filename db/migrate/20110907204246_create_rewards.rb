class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.integer :point_value
      t.integer :plan_id

      t.timestamps
    end
  end
end
