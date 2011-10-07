class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.date :targetDate
      t.string :title
      t.integer :student_id
      t.integer :teacher_id
      t.integer :sponsorship_id

      t.timestamps
    end
  end
end
