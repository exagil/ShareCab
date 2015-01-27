# == Schema Information
#
# Table name: ridings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  ride_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RidingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
