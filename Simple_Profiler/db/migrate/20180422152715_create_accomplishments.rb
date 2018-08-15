class CreateAccomplishments < ActiveRecord::Migration[5.2]
  def change
    create_table :accomplishments do |t|
      t.references :profile, foreign_key: true
      t.string :title
      t.string :type_of_award
      t.date :date_of_award
      t.text :award_description

      t.timestamps
    end
  end
end
