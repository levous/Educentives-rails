class AddCompletedPointsToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :points_complete, :integer
  end
end
