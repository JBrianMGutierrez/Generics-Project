class AddSomeFieldsToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :location_city, :string
    add_column :profiles, :main_skill, :string
    add_column :profiles, :main_hobby, :string
    add_column :profiles, :education_status, :string
  end
end
