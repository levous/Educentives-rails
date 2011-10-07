class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :title
      t.text :long_description
      t.integer :point_value
      t.integer :goal_id
      t.datetime :target_datetime
      t.datetime :completed_at
      t.timestamps
    end
  end
end
