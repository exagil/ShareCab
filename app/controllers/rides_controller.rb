class RidesController < ApplicationController
  before_action :restrict_access, except: [:index]
  
  def create
    @errors = Ride.validates_presence_of_ride_params(params).messages
    if @errors.length>=1
      render new_ride_path
    else
      date = Ride.form_to_rails_date(params[:date])
      time = Ride.form_to_rails_time(params[:date], params[:time])
      ride = Ride.new(ride_params)
      ride.origin_long = params[:origin_lng]
      ride.destination_long = params[:destination_lng]
      ride.departure_date = date
      ride.departure_time = time
      ride.initiator_id = current_user.id
      ride.number_of_seats = 3
      ride.number_of_seats_occupied = 1
      ride.save!
      ride.ridings.create(user_id: current_user.id)
      redirect_to static_pages_successful_ride_creation_url
    end
  end

  def index
    # sets a range (flexibility)
    # stores all the rides in rides variable
    # makes an empty instance level array @rides
    # for each ride, if
      # the distance between the entered origin and the ride origin is less than range
      # the distance between the entered destination and the ride destination is less than range
    # cool! store it in @rides_display
    @rides = []
    if((params[:time_right] && !params[:time_right].empty?) && (params[:time_left] && !params[:time_left].empty?))
      session[:time_right] = params[:time_right]
      session[:time_left] = params[:time_left]
      @rides = Ride.filter_suitable_rides(5, session[:origin_lat],session[:origin_lng], session[:destination_lat],session[:destination_lng], (session[:date_filter] || session[:date]), params[:time_left], params[:time_right])
    elsif (params.length>=4)
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
      @rides = Ride.get_suitable_rides(2, session[:origin_lat],session[:origin_lng], session[:destination_lat],session[:destination_lng], (session[:date_filter] || session[:date]).to_date)
    end
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
    is_passenger = ride.passenger_ids.include? current_user.id
    # takes care that an initiator cannot join his own ride
    # takes care that a person who has already joined the ride cannot join a ride
    if is_passenger
      flash[:warning] = "You are a part of the ride already!"
      redirect_to ride_path(ride)
    elsif(!is_passenger && ride.departure_time>Time.now)
    # creates new details in riding
      riding = ride.ridings.new(user_id: current_user.id)
      riding_save = riding.save
      if riding_save
        ride.update(number_of_seats_occupied: ride.number_of_seats_occupied+1)
        flash[:success] = "Congratulations! Your cab is booked"
        UserMailer.join(current_user.email, current_user.name).deliver_now
      end
      redirect_to static_pages_successful_ride_creation_path
    end
  end

  def edit
  end

  private
    def ride_params
      params.permit(:origin, :destination, :origin_lat, :destination_lat)
    end
end