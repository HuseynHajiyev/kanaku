class JourneysController < ApplicationController
  before_action :find_journey, only: %i[edit update show]

  def index
    @journeys = current_user.journeys
  end

  def show
    @markers = [{ lat: 48.847387, lng: 2.340593 }, { lat: 48.854467, lng: 2.345068 }, { lat: 48.860365, lng: 2.338580 }]

    @journey_venues = @journey.venues

    # @markers = @journey_venues.geocoded.map do |journey_venue|
    #   {
    #     lat: journey_venue.latitude,
    #     lng: journey_venue.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { journey_venue: journey_venue })
    #   }
    # end
  end

  def edit; end

  def preview
    @journey = current_user.journeys.last
  end

  def new; end

  def update
    @journey.update(journey_params)
    redirect_to journey_path(@journey)
  end

  private

  def find_journey
    @journey = current_user.journeys.last
  end

  def journey_params
    params.require(:journey).permit(:description)
  end
end
