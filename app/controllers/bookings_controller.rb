class BookingsController < ApplicationController
  before_action :set_booking, only: %I[edit update destroy]

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

  def edit
    authorize @booking
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @booking
  end

  def destroy
    @booking.destroy

    redirect_to bookings_path, status: :see_other
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
