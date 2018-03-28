class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body, presence: true
      t.integer :user_id, presence: true
      t.integer :link_id, presence: true
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
