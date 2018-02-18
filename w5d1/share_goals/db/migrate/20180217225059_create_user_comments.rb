class CreateUserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.integer :parent_id

      t.timestamps
    end

    add_index :user_comments, :user_id
  end
end
