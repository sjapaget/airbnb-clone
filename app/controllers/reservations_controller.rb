class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation)
  end
end
