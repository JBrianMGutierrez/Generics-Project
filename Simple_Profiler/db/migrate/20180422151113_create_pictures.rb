class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :award, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
