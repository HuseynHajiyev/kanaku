class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
  end

  def index
    @cities = City.all
  end
end
