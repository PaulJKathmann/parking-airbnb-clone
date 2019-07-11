class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :in_range, -> range {
  where('(start_date <= ? and ? <= ? and end_date >= ?)',range.first, range.first, range.last, range.last)
  }
end
