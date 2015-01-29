class User < ActiveRecord::Base
	validates :email, uniqueness: true
	validates :password, presence: true
	validates :phone_number, uniqueness: true
end 