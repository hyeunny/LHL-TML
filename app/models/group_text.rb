class GroupText < ActiveRecord::Base
	validates :group_name, presence: true
	validates :phone_num, presence: true
	validates :phone_num, length: { is: 10 }
end 