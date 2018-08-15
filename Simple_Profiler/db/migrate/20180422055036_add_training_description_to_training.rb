class AddTrainingDescriptionToTraining < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :training_description, :text
  end
end
