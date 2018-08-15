class RemoveBiographyFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :biography, :text
  end
end
