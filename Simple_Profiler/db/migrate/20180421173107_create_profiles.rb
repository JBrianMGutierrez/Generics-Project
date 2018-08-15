class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :profile_picture
      t.date :date_of_birth
      t.string :civil_status
      t.string :gender
      t.string :contact_number
      t.string :education

      t.timestamps
    end
  end
end
