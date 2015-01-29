class StaticPagesController < ApplicationController
  before_action :restrict_access, except: [:index, :about, :contact_us, :no_ride_found]

  def index
  end

  def about
  end

  def contact_us
  end

  def no_ride_found
  end

  def dashboard
  end

  def successful_ride_creation
  end
end
