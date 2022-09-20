class Reservation < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user

  validates :bicycle, :user, :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :start_date, :end_date, uniqueness: { scope: :bicycle,
                                                  message: "This bicycle isn't available" }
end
