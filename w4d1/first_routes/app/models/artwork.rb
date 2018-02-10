class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: { scope: :title }, presence: true
  validates :image_url, presence: true

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id
end