class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string :title
      t.integer :teacher_id

      t.timestamps
    end
  end
end
