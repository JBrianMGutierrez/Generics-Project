class ChangeAwardIdName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :award_id, :accomplishment_id
  end
end
