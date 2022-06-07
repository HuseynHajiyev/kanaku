class CitiesController < ApplicationController
  def show
    @cities = City.find(params[:id])
  end
end
