class VenuesController < ApplicationController
  before_action :find_venue, only: %i[edit show update destroy]

  def show; end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.city = City.find(1)
    @venue.save! ? redirect_to(venue_path(@venue)) : render(:new)
  end

  def edit; end

  def update
    @venue.save ? redirect_to(venue_path(@venue)) : render(:new)
  end

  def destroy
    @venue.destroy
    redirect_to root_path
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:address, :description, :name)
  end
end
