# == Schema Information
#
# Table name: rides
#
#  id                       :integer          not null, primary key
#  origin                   :string
#  origin_lat               :float
#  origin_long              :float
#  destination              :string
#  destination_lat          :float
#  destination_long         :float
#  departure_date           :date
#  departure_time           :time
#  number_of_seats          :integer
#  number_of_seats_occupied :integer
#  completed                :boolean
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  initiator_id             :integer
#

class Ride < ActiveRecord::Base
  has_many :ridings
  has_many :users, through: :ridings
  has_many :comments

  validates :origin, presence: true
  validates :destination, presence: true
  # validates :departure_date, presence: true
  # validates :departure_time, format: { with: /(\d+)\s:\s(\d+)\s:\s(AM|PM)/ }, :length => {:minimum => 4}

  # geocoded_by :destination, :latitude => :destination_lat, :longitude => :destination_long
  # after_validation :geocode

  # def geocode_the_start_address
  #   coords = Geocoder.coordinates(self.origin)
  #   self.origin_lat = coords[0]
  #   self.origin_long = coords[1]
  # end

  def self.form_to_rails_date(date)
    date.to_date
  end

  def self.form_to_rails_time(form_date, form_time)
    form_date_regex = form_date.match(/^((\d+)-(\d+)-(\d+))$/)
    day   = form_date_regex[2]
    month = form_date_regex[3]
    year  = form_date_regex[4]

    form_time = form_time.gsub(" ", "")
    form_time_regex = form_time.match(/^((\d+):(\d+):(AM|PM))$/)
    hour = form_time_regex[2]
    minute = form_time_regex[3]
    am_pm = form_time_regex[4]

    if(am_pm == "AM")
      return Time.new(year, month, day, hour, minute, 0, "+05:30")
    elsif(am_pm == "PM" && hour == "12")
      return Time.new(year, month, day, hour, minute, 0, "+05:30")
    elsif(am_pm == "PM" && hour != "12")
      return Time.new(year, month, day, hour, minute, 0, "+05:30") + 43200
    end
  end

  def self.filter_form_to_rails_time(form_date, filter_time)
    form_date_regex = form_date.match(/^((\d+)-(\d+)-(\d+))$/)
    day   = form_date_regex[2]
    month = form_date_regex[3]
    year  = form_date_regex[4]

    filter_time = filter_time.gsub("/\s+/", " ").gsub("/:\s+/", ":").gsub(" ", ":")
    filter_time_regex = filter_time.match(/^((\d+):(\d+):(AM|PM))$/)
    hour = filter_time_regex[2]
    minute = filter_time_regex[3]
    am_pm = filter_time_regex[4]

    if(am_pm == "AM")
      return Time.new(year, month, day, hour, minute, 0, "+05:30")
    elsif(am_pm == "PM" && hour == "12")
      return Time.new(year, month, day, hour, minute, 0, "+05:30")
      elsif(am_pm == "PM" && hour != "12")
      return Time.new(year, month, day, hour, minute, 0, "+05:30") + 43200
    end
  end

  def self.filter_form_time_to_minutes(form_date, filter_time)
    time = Ride.filter_form_to_rails_time(form_date, filter_time)
    time = time.strftime("%H").to_i * 60 + time.strftime("%M").to_i
    time
  end

  def self.filter_suitable_rides(range, origin_lat,origin_lng, destination_lat, destination_lng, filter_date, filter_time_minimum, filter_time_maximum)
    filter_time_minimum = self.filter_form_to_rails_time(filter_date, filter_time_minimum)
    filter_time_maximum = self.filter_form_to_rails_time(filter_date, filter_time_maximum)
    rides = self.where("departure_time>? AND departure_time<?", filter_time_minimum, filter_time_maximum)
    @rides_display = []
    rides.each do |ride|
      # distance between entered origin and db origin
      distance_origin = Geocoder::Calculations.distance_between([origin_lat, origin_lng],[ride.origin_lat, ride.origin_long])
      if distance_origin < range
        distance_destination = Geocoder::Calculations.distance_between([destination_lat, destination_lng],[ride.destination_lat, ride.destination_long])
        if distance_destination < range
          @rides_display << ride
        end
      end
    end
    @rides_display
  end

  def self.get_suitable_rides(range, origin_lat,origin_lng, destination_lat, destination_lng, date)
    rides = self.where(departure_date: date)
    @rides_display = []
    rides.each do |ride|
      # distance between entered origin and db origin
      distance_origin = Geocoder::Calculations.distance_between([origin_lat, origin_lng],[ride.origin_lat, ride.origin_long])
      if distance_origin < range
        distance_destination = Geocoder::Calculations.distance_between([destination_lat, destination_lng],[ride.destination_lat, ride.destination_long])
        if distance_destination < range
          @rides_display << ride
        end
      end
    end
    @rides_display
  end

  def initiator
    User.find(self.initiator_id) if self.initiator_id
  end

  def self.validates_presence_of_ride_params(params)
    errors = ActiveModel::Errors.new(self)
    errors.add(:origin, "cannot be blank") if params[:origin].nil? || params[:origin].blank?
    errors.add(:destination, "cannot be blank") if params[:destination].nil? || params[:destination].blank?
    errors.add(:departure_time, "cannot be blank") if params[:time].nil? || params[:time].blank?
    errors.add(:departure_time, "cannot be blank") if params[:date].nil? || params[:date].blank?
    errors
  end

  # returns an array of passenger ids associated with the ride
  # def passenger_ids
  #   passenger_ids = []
  #   self.ridings.
  # end
end
