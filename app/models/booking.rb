class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :start_date, presence: true, if: :overlap?
  # Valdiation that dates don't overlap while booking
  def overlap?
    range = Range.new start_date, end_date
    overlaps = Space.where(id: self.space).in_range(range)
    overlap_error if overlaps.empty?
  end

  def overlap_error
    errors.add(:overlap_error, 'Your request is outside of the offered booking times!')
  end
end
