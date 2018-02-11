class Cat < ApplicationRecord
  CAT_COLORS = %w(red yellow orange black brown tan white).freeze

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: CAT_COLORS }

  def age
    time_ago_in_words(birth_date)
  end
end