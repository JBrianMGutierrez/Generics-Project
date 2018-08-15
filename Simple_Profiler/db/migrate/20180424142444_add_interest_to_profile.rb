class AddInterestToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :interest, :string
  end
end
