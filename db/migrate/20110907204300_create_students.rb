class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :title
      t.integer :person_id

      t.timestamps
    end
  end
end
