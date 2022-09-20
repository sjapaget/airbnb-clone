class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).joins(:bicycle).where(bicycle: { user: current_user })
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bicycle = Bicycle.find(params[:booking][:bicycle_id])

    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
