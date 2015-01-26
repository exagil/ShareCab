class RidesController < ApplicationController
  def create
    fail
  end

  def index
    # sets a range (flexibility)
    # stores all the rides in rides variable
    # makes an empty instance level array @rides
    # for each ride, if
      # the distance between the entered origin and the ride origin is less than range
      # the distance between the entered destination and the ride destination is less than range
    # cool! store it in @rides_display
    @rides = Ride.get_suitable_rides(5, params[:origin_lat],params[:origin_lng], params[:destination_lat],params[:destination_lng])
    if(@rides.length<1) # no rides
      redirect_to new_ride_url
    end
  end

  def new
    @ride = Ride.new
  end
end