class ChangeDescriptionToBeTextInCats < ActiveRecord::Migration[5.1]
  def change
    change_column :cats, :description, :text
  end
end
