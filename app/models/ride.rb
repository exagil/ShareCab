class Ride < ActiveRecord::Base
  has_many :ridings
  has_many :users, through: :ridings
end
