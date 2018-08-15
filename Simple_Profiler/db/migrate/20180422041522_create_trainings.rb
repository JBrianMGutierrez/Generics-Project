class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.references :profile, foreign_key: true
      t.string :speaker
      t.date :date_of_training
      t.string :type_of_training
      t.string :certificate

      t.timestamps
    end
  end
end
