class Sub < ApplicationRecord
  validates :title, :description, :creator_id, presence: true

  #belongs_to :moderator, class_name: :User, foreign_key: :creator_id
  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs, source: :post
end
