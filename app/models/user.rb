# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  sign_in_count      :integer          default("0"), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string
#  last_sign_in_ip    :string
#  created_at         :datetime
#  updated_at         :datetime
#  name               :string
#  gender             :string
#  dob                :date
#  provider           :string
#  uid                :string
#  image              :string
#

class User < ActiveRecord::Base
  
  has_many :ridings
  has_many :rides, through: :ridings
  has_many :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
#IMPROVE
  def self.from_omniauth(auth)
    bool=User.find_by(email: auth.info.email)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.dob = auth.extra.raw_info.user_birthday
      user.gender = auth.extra.raw_info.gender
      if bool==nil
        UserMailer.welcome(auth.info.email, auth.info.name).deliver_now
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
