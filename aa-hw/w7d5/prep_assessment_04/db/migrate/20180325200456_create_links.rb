class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :title, prsence: true
      t.string :url, presence: true
      t.integer :user_id, presence: true

      t.timestamps
    end

    add_index :links, :user_id
  end
end
