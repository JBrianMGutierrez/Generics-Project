class ChangeAwardToAchievement < ActiveRecord::Migration[5.2]
  def change
    rename_table :awards, :achievement
  end
end
