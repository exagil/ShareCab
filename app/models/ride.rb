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
#  initiater_id             :integer
#

class Ride < ActiveRecord::Base
  has_many :ridings
  has_many :users, through: :ridings

  # geocoded_by :destination, :latitude => :destination_lat, :longitude => :destination_long
  # after_validation :geocode

  # def geocode_the_start_address
  #   coords = Geocoder.coordinates(self.origin)
  #   self.origin_lat = coords[0]
  #   self.origin_long = coords[1]
  # end

  def self.get_suitable_rides(range, origin_lat,origin_lng, destination_lat, destination_lng)
    rides = self.all
    @rides_display = []
    rides.each do |ride|
      # distance between entered origin and db origin
      distance_origin = Geocoder::Calculations.distance_between([origin_lat, origin_lng],[ride.origin_lat, ride.origin_long])
      distance_destination = Geocoder::Calculations.distance_between([destination_lat, destination_lng],[ride.destination_lat, ride.destination_long])
      if distance_origin < range && distance_destination < range
        @rides_display << ride
      end
    end
    @rides_display
  end
end
