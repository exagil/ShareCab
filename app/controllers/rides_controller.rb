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

    range = 5 # set the range here
    rides = Ride.all
    @rides_display = []
    rides.each do |ride|
      # distance between entered origin and db origin
      distance_origin = Geocoder::Calculations.distance_between([params[:origin_lat],params[:origin_lng]],[ride.origin_lat, ride.origin_long])
      distance_destination = Geocoder::Calculations.distance_between([params[:destination_lat],params[:destination_lng]],[ride.destination_lat, ride.destination_long])
      if distance_origin < range && distance_destination < range
      @rides_display << ride
      end
    end
  end
end