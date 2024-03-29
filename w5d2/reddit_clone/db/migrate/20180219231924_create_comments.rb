class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :author_id, null: false
      t.integer :post_id, null: false
      t.integer :parent_comment_id, default: nil

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :author_id
  end
end
