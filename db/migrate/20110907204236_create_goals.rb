class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :long_description
      t.integer :point_value
      t.integer :plan_id
      t.datetime :target_datetime
      t.datetime :completed_at
      t.timestamps
    end
  end
end
