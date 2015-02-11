
class Text < ActiveRecord::Base
	belongs_to :user
	validates :recipient_phone_number, presence: true 
	validates :recipient_phone_number, length: { is: 10 }
	validates :content, presence: true 	

	def send_text(phonenumber, body) 
		account_sid = :Account_sid
		auth_token = :Auth_token
		client = Twilio::REST::Client.new account_sid, auth_token
		 #need to move these account_sid and the auth_token to a move secure file
		from = "+1 902-701-5580" # Your Twilio number
		message = client.account.messages.create(
		    :from => "+19027015580",
		    :to => "+1#{phonenumber}",
		    :body => "#{body}"
		  )
		message
	end 

	def self.pending
		Text.where(status: "pending")
	end 

	def self.archive
		Text.where(status: "sent")
	end 

	def delete
		destroy 
	end 
end 
