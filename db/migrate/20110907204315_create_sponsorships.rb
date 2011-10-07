class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.string :title
      t.integer :person_id

      t.timestamps
    end
  end
end
