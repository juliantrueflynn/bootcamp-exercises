class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :public, default: true

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
