class ChangePictureName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :picture, :award_picture
  end
end
