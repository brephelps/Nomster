class PlacesController < ApplicationController

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
    Place.create(place_params)
    redirect_to root_path
  end
end


private


def place_params
  params.require(:place).permit(:name, :address, :description)
end