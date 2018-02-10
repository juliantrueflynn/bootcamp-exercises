class Comment < ApplicationRecord
  validates :user_id, :artwork_id
  validates :body, presence: true

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :artwork
end