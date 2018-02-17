class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true

  belongs_to :band

  def band_name
    band = Band.find_by(id: band_id)
    band.name
  end
end
