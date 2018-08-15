class MigrateBiographyToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :biography, :text
  end
end
