class VenuesController < ApplicationController
  before_action :find_venue, only: %i[edit show update destroy]

  def show
    @journey_venue = JourneyVenue.find_by(journey: current_user.journeys.last, venue: @venue)
  end

  def new
    @venue = Venue.new
    @cities = City.all
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.city = City.find(params[:venue][:city_id])

    @venue.save ? redirect_to(venue_path(@venue)) : render(:new)
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
    params.require(:venue).permit(:address, :description, :name, photos: [])
  end
end
