class CreateViewedGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :viewed_goals do |t|
      t.integer :user_id, null: false
      t.integer :goal_id, null: false

      t.timestamps
    end

    add_index :viewed_goals, :user_id
    add_index :viewed_goals, :goal_id
  end
end
