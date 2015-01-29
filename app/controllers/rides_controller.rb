class RidesController < ApplicationController
  before_action :restrict_access, except: [:index]
  def create
    Ride.create(:origin=>params[:origin],
                :destination=>params[:destination],
                :origin_lat=>params[:origin_lat],
                :origin_long=>params[:origin_lng],
                :destination_lat=>params[:destination_lat],
                :destination_long=>params[:destination_lng],
                :departure_date=>params[:date],
                :initiater_id=>current_user.id)
    redirect_to static_pages_successful_ride_creation_url
    # current_user.rides.create(origin: , origin_lat: nil, origin_long: nil, destination: nil, destination_lat: nil, destination_long: nil, departure_date: nil, departure_time: nil, number_of_seats: nil, number_of_seats_occupied: nil, completed: nil, created_at: nil, updated_at: nil, initiater_id: nil)
  end

  def index
    # sets a range (flexibility)
    # stores all the rides in rides variable
    # makes an empty instance level array @rides
    # for each ride, if
      # the distance between the entered origin and the ride origin is less than range
      # the distance between the entered destination and the ride destination is less than range
    # cool! store it in @rides_display
    if (params.length>=4)
      session[:origin] = params[:origin]
      session[:destination]=params[:destination]
      session[:origin_lat] = params[:origin_lat]
      session[:origin_lng] = params[:origin_lng]
      session[:destination_lat] = params[:destination_lat]
      session[:destination_lng] = params[:destination_lng]
    end
    @rides = Ride.get_suitable_rides(5, session[:origin_lat],session[:origin_lng], session[:destination_lat],session[:destination_lng])
    if(@rides.length<1) # no rides
      redirect_to static_pages_no_ride_found_url
    end
  end

  def new

    @ride = Ride.new
  end

  def show
    @ride = params[:id]
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
    def ride_params
      params.require(:ride).permit(:origin, :destination, :origin_lat, :origin_lng, :destination, :destination_lat, :destination_lng, :date)
    end
end