class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    
  end

  def index
    fail
  end

end