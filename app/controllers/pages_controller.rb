class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:city].present? || params[:venue].present?
      cities_result = City.search_by_name(params[:city])
      if cities_result.nil? || cities_result.empty?
        @cities = City.all
        @venues_geocode = Venue.search_by_name(params[:venue])
      else
        @cities = cities_result
        cities_result_name = @cities.empty? ? "" : @cities.first.name.capitalize
        @venues = Venue.search_by_name(params[:venue])
        @venues_geocode = @venues.empty? ? Venue.near(cities_result_name) : @venues.near(cities_result_name)
      end
    else
      @cities = City.all
      @venues_geocode = Venue.all
    end
    @venues = [@venues_geocode].flatten
    @markers = @venues_geocode.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
        image_url: helpers.asset_url("marker-stroked.svg")
      }
    end
  end
end
