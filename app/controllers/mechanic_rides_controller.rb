class MechanicRidesController < ApplicationController
  def create
    MechanicRide.create!(mechanic_ride_params)
    redirect_to "/mechanics/#{params[:id]}"
  end

  private

  def mechanic_ride_params
    params.permit(:mechanic_id, :ride_id)
  end
end
