class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true

  belongs_to :band
end
