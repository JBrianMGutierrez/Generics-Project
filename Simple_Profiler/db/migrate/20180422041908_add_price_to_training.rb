class AddPriceToTraining < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :price, :string
  end
end
