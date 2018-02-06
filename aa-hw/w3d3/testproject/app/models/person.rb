class Person < ApplicationRecord
  validates :name, :house, presence: true

  belongs_to :house,
    class_name: 'House',
    foreign_key: :house_id,
    primary_key: :id
end