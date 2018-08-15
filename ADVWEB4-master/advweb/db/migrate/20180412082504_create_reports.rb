class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :report_title
      t.datetime :report_date
      t.string :report_title
      t.text :report_description
      t.string :report_location
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reports, [:user_id, :created_at]
  end
end
