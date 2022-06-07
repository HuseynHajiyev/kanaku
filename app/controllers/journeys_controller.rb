class JourneysController < ApplicationController
  before_action :find_journey, only: %i[edit update]

  def index
    @journeys = Journey.all
  end

  def edit; end

  def update
    @journey.update(journey_params)
    redirect_to journey_path(@journey)
  end

  private

  def find_journey
    @journey = Journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:description)
  end
end
