class Booking < ApplicationRecord
  belongs_to :bicycle

  validates :bicycle, :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :start_date, :end_date, uniqueness: { scope: :bicycle,
                                                  message: "This bicycle is already available to rent for this period" }
end
