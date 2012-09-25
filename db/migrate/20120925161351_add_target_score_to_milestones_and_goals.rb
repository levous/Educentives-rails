class AddTargetScoreToMilestonesAndGoals < ActiveRecord::Migration
  def change
    add_column :goals, :target_score, :integer
    add_column :goals, :target_label, :string
    add_column :milestones, :target_score, :integer

    create_table :assessments do |t|
      t.integer :goal_id
      t.integer :score
 
      t.timestamps
  end
end
