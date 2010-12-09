class User < ActiveRecord::Base
  devise :omniauthable

  has_many :authentications

  attr_accessible :email, :remember_me
end
