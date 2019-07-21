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
end