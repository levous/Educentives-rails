class CreateAdvocacies < ActiveRecord::Migration
  def change
    create_table :advocacies do |t|
      t.string :relationship
      t.integer :person_id

      t.timestamps
    end
  end
end
