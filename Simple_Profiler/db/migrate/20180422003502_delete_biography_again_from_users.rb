class DeleteBiographyAgainFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :biography
  end

  def down
    add_column :users, :biography, :text
  end
end
