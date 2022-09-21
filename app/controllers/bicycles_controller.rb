class BicyclesController < ApplicationController
  before_action :set_bicycle, only: %I[show edit update destroy]
  def index
    @bicycles = policy_scope(Bicycle)

    @markers = @bicycles.geocoded.map do |bicycle|
      {
        lat: bicycle.latitude,
        lng: bicycle.longitude
      }
    end
  end

  def show
    authorize @bicycle
  end

  def new
    @bicycle = Bicycle.new
    authorize @bicycle
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.user = current_user
    @bicycle.photo = Bicycle::DEFAULT_IMG unless params[:photo].present?

    if @bicycle.save
      redirect_to bicycles_path
    else
      render :new, status: :unprocessable_entity
    end
    authorize @bicycle
  end

  def edit
    authorize @bicycle
  end

  def update
    if @bicycle.update(bicycle_params)
      redirect_to bicycle_path(@bicycle)
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @bicycle
  end

  def destroy
    @bicycle.destroy

    redirect_to bicycles_path, status: :see_other
    authorize @bicycle
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:title, :description, :category, :size, :price_per_day, :photo, :address)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
