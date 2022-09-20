class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).joins(:bicycle).where(bicycle: { user: current_user })
  end
end
