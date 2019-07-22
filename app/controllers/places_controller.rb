class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def Kaminari.configure
    paginates_per 10
    max_paginates_per 10
  end
  def index
    @places = Place.all.order(:name).page params[:page]
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    redirect_to root_path
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end


  private


  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
