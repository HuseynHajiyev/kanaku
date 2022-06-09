class CitiesController < ApplicationController
  before_action :find_city, only: %i[show]
  def index
    @cities = City.all
  end

  def show
    @venues = Venue.where(city_id: @city.id)
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.save
  end

  private

  def find_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :description, :latitude, :longitude, :name_country, photos: [])
  end
end
