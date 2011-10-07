class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :title
      t.integer :person_id

      t.timestamps
    end
  end
end
