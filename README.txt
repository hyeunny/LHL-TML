
.
READ ME 
TEXT ME LATER


USER STORIES
	(1)
		As a user, I want to login to my user page
		where I can type in messages to have them sent by SMS 
		at a scheduled time of my choosing
		(a)
			I want to be able to input a phone number to send to
		(b) 
			I want to be able to input the content of my message
		(c)
			I want to be able to specify a particular time for delivery
		(d)
			I want to be able to submit my request, and have visual feedback for submission of request
		(e)
			I want the request to be added to my all messages page


	(2)
		As a user, I want to click on a link on my nav bar 
		that takes me to all of the messages I have sent 
		or are pending

	(3)
		As a user, I want a web application to be responsive
		for use on my mobile phone. 

OPTIONAL 

	As a user I want to be able to optionally time stamp my messages
	to tell the recipient when the message was queued and the scheduled delivery time
	e.g. "This is a scheduled text message"

DEPLOYMENT
	- development in SQlite, if we have time to deploy it, move to Postgres (Heroku)

DATA
	- Models 
		(1) Users (Has many :messages)

			*columns: users
					-Users.ID     (Primary key)
					-firstname    (string)
					-email		    (string)
					-phone number (string)

		(2) Messages (Belongs_to :users)

			*columns :messages 
					-Messages.ID			(Foreign key)
					-users.ID 				(Primary key)
					-content 					(string)
					-Recipient Number (string)
					-Date/time 				(datetime)
	-QUE 

		*make a separate rake task 
			-that will pull all of the pending messages with a send
			time that time frame (run every x minutes)
			-query sent time between x->y (send to twilio)
				




