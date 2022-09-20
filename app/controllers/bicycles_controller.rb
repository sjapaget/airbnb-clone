class BicyclesController < ApplicationController
  before_action :set_bicycle, only: %I[show]
  def index
    @bicycles = policy_scope(Bicycle)
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

  private

  def bicycle_params
    params.require(:bicycle).permit(:title, :description, :category, :size, :price_per_day, :photo)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
