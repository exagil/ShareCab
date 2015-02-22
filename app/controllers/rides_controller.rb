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
                :initiator_id=>current_user.id)
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
      if params[:date]
        session[:date] = params[:date] if params[:date]
        session[:date_filter] = nil
      elsif params[:date_filter]
        session[:date] = nil
        session[:date_filter] = params[:date_filter]
      end
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
    @ride = Ride.find(params[:id])
    @comment = Comment.new
    @comment.ride_id = @ride.id
    @comments = @ride.comments # sort comments
  end

  def destroy
  end

  def update
    ride = Ride.find(params[:id])
    riding =ride.ridings.new(user_id: current_user.id)
    riding_save = riding.save
    if riding_save
      UserMailer.join(current_user.email, current_user.name).deliver_now
    end
    redirect_to root_path
  end

  def edit
  end

  private
    def ride_params
      params.require(:ride).permit(:origin, :destination, :origin_lat, :origin_lng, :destination, :destination_lat, :destination_lng, :date)
    end
end