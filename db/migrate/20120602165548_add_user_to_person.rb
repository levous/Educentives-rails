class AddUserToPerson < ActiveRecord::Migration
  def change 
    add_column :people, :user_id, :integer
    add_column :users, :person_id, :integer
  end
  
end
