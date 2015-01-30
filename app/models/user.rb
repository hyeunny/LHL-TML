class User < ActiveRecord::Base
	validates :email, uniqueness: true
	validates :password, presence: true
	validates :phone_number, uniqueness: true 
	validates :phone_number, presence: true
	validates :email, presence: true
end 