class AddBiographyToProfile < ActiveRecord::Migration[5.2]
  def up
    remove_column :profiles, :biography
  end

  def down
    add_column :profiles, :biography, :text
  end
end
