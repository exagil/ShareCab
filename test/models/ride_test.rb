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

require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
