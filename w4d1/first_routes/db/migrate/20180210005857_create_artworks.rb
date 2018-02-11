class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.integer :artist_id
      t.timestamps
    end

    add_index :artworks, [:artist_id, :title]
  end
end
