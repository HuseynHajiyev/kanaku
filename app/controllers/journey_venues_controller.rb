class JourneyVenuesController < ApplicationController
  # before_action
  include ActionView::Helpers::UrlHelper

  def create
    # if session[:journey].nil?
    #   session[:jouney] = Journey.new
    #   session[:journey].user = current_user
    #   session[:journey].save!
    # end
    @venue = Venue.find(params[:venue_id])
    @journey = current_user.journeys.nil? ? Journey.create!(user: current_user) : current_user.journeys.last
    @journey_venue = JourneyVenue.new
    # @journey_venue.journey = session[:journey]
    @journey_venue.venue = @venue
    @journey_venue.journey = @journey
    @journey_venue.save
    redirect_to venue_path(@venue)
  end

  def destroy
    @journey_venue = JourneyVenue.find(params[:id])
    @venue = @journey_venue.venue
    @journey_venue.destroy
    if current_page?(controller: "venues")
      redirect_to venue_path(@venue)
    else
      redirect_to journey_path(Journey.find(params[:journey_id][:id]))
    end
  end
end
