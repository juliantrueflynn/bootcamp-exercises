class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED) }
  validate :does_not_overlap_approved_request
  
  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where.not(id: id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end
  
  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:approved_request] << 'can not overlap with other Approved status'
    end
  end
end