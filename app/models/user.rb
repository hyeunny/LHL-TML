class User < ActiveRecord::Base
	validates :email, uniqueness :true
	validates :password, prescence :true
	validates :phone_number, uniqueness :true
end 