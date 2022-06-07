class CitiesController < ApplicationController
  def show
    @cities = City.find(params[:id])
  end

  def index
    @cities = City.all
  end
end
