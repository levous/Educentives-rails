class AddPercentCompleteToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :percent_complete, :decimal
  end
end
