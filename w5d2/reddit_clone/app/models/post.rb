class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: { message: 'must have at least one sub' }

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub
  has_many :comments, inverse_of: :post
end
