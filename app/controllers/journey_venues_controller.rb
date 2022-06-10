class JourneyVenuesController < ApplicationController
  # before_action

  def create
    # if session[:journey].nil?
    #   session[:jouney] = Journey.new
    #   session[:journey].user = current_user
    #   session[:journey].save!
    # end
    @venue = Venue.find(params[:venue_id])
    @journey = Journey.last.nil? ? Journey.create!(user: current_user) : Journey.last
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
    redirect_to venue_path(@venue)
  end
  # def find_venue
  #   @venue = Venue.find(params[:venue_id])
  # end
end
