class RidesController < ApplicationController
  before_action :restrict_access, except: [:index]
  
  def create
    date = Ride.form_to_rails_date(params[:date])
    time = Ride.form_to_rails_time(params[:date], params[:time])
    # Ride.create(
    #   :origin=>params[:origin],
    #   :origin_lat=>params[:origin_lat],
    #   :origin_long=>params[:origin_lng],
    #   :destination=>params[:destination],
    #   :destination_lat=>params[:destination_lat],
    #   :destination_long=>params[:destination_lng],
    #   :departure_date=>params[:date],
    #   :initiator_id=>current_user.id,
    #   :departure_date=>Ride.form_to_rails_date(params[:date]),
    #   :departure_time=>params[:time]
    # )
    ride = Ride.new(ride_params)
    ride.origin_long = params[:origin_lng]
    ride.destination_long = params[:destination_lng]
    ride.departure_date = date
    ride.departure_time = time
    ride.initiator_id = current_user.id
    ride.save
    byebug
    
    redirect_to static_pages_successful_ride_creation_url
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
      params.permit(:origin, :destination, :origin_lat, :destination_lat)
    end
end