class Text < ActiveRecord::Base
	







	def send_text 
		account_sid = "ACa8a4fcd6af4ee24daee4a7f031a0497f"
		auth_token = "511b81412170f75d71b0a0ca5d8eaa51"
		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+1 902-701-5580" # Your Twilio number
		 
		# when the app is working, going to want to add an each method
		# to iterate through each 'text' instance returned by 
		# rake file Jerry is working on. So that each text is sent accordingly. 
		# set the attributes of the Text class to be passed into the 
		# message.create method
		message = client.account.messages.create(
		    :from => "+19027015580",
		    :to => "+19027195640",
		    :body => "Hey, this is a test message"
		  )
		message
	end 
end 