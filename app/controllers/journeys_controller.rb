class JourneysController < ApplicationController
  def index
    @journeys = Journey.all
  end

  def edit
    @journeys = Journey.find(params[:id])
  end

  def update
    @journey = Journey.find(params[:id])
    @journey.update(journey_params)
    redirect_to journey_path(@journey)
  end

  private

  def journey_params
    params.require(:journey).permit(:description)
  end
end
