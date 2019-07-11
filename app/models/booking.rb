class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :start_date, presence: true, if: :overlap?
  validates :end_date, presence: true, if: :overlap?
  validates :status, presence: true
  validates :cost, presence: true

  # Valdiation that dates fit
  def overlap?
    if self.space.start_date.nil? && self.space.end_date.nil?
      if end_date < start_date
        overlap_error
      else
        return true
      end
    else
      range = Range.new start_date, end_date
      if range.end.nil? || range.begin.nil?
        overlap_error
      else
        overlaps = Space.where(id: self.space).in_range(range)
        overlap_error if overlaps.empty?
      end
    end
  end

  def overlap_error
    errors.add(:overlap_error, 'Your request is outside of the offered booking times!')
  end
end
