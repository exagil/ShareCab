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

  def Ride.get_suitable_rides(range, origin_lat,origin_lng, destination_lat, destination_lng)
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