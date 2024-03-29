class AddIndexSessionTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :session_token, unique: true
    add_index :users, :email, unique: true
  end
end
