class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation)
  end

  def new
    @bicycle = Bicycle.find(params[:bicycle_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.bicycle = Bicycle.find(params[:bicycle_id])

    if @reservation.save
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
    authorize @reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
