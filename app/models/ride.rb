class Ride < ActiveRecord::Base
  has_many :ridings
  has_many :users, through: :ridings

  geocoded_by :destination, :latitude => :destination_lat, :longitude => :destination_long
  after_validation :geocode

  def geocode_the_start_address
    coords = Geocoder.coordinates(self.origin)
    self.origin_lat = coords[0]
    self.origin_long = coords[1]
  end
end
