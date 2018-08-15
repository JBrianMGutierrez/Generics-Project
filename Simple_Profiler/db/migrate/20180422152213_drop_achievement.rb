class DropAchievement < ActiveRecord::Migration[5.2]
  def up

  end

  def down
    drop_table :achievement
  end
end
