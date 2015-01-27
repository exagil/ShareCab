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

class Riding < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
end
