class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED) }
  belongs_to :cat
end