class User < ActiveRecord::Base
  devise :omniauthable

  has_many :authentications

  attr_accessible :email, :name, :remember_me
end
