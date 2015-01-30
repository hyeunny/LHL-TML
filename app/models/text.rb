
class Text < ActiveRecord::Base
	validates :recipient_phone_number, presence: true 
	validates :recipient_phone_number, length: { is: 10 }
	validates :content, presence: true 	

	def send_text(phonenumber, body) 
			account_sid = "ACa8a4fcd6af4ee24daee4a7f031a0497f"
			auth_token = "511b81412170f75d71b0a0ca5d8eaa51"
		client = Twilio::REST::Client.new account_sid, auth_token
		 #need to move these account_sid and the auth_token to a move secure file
		
		from = "+1 902-701-5580" # Your Twilio number
		 
		# when these app is working, going to want to add an each method
		# to iterate through each 'text' instance returned by 
		# rake file. So that each text is sent accordingly. 
		# set the attributes of the Text class to be passed into the 
		# message.create method
		
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
end 
