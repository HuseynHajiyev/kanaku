class CitiesController < ApplicationController
  before_action :find_city, only: %i[show]
  def index
    @cities = City.all
  end

  def show; end

  private

  def find_city
    @city = City.find(params[:id])
  end
end
