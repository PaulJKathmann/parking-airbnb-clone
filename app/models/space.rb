class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, presence: true
  validate :time_order?
  validates :price, presence: true
  validates :size, presence: true
  validates :photo, presence: true

  def time_order?
    if start_date.nil? && end_date.nil?
      return true
    else
      time_error if end_date < start_date
    end
  end

  def time_error
    errors.add(:time_error, 'Times aren\'t added correctly!')
  end

  scope :in_range, -> range {
  where('(start_date <= ? and ? <= ? and end_date >= ?)',range.first, range.first, range.last, range.last)
  }
end
