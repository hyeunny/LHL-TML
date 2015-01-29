# Homepage (Root path)
helpers do 
	def current_user 
		if session[:user_id]
		  @user = User.find(session[:user_id])
    end
	end 
end 

get '/' do
  erb :index 
end

get '/user/new' do
  erb :'users/new'
end

get '/login' do
  erb :login
end

get '/user/:id' do
 	erb :'users/show'
end

get '/user/:id/texts/pending' do
  erb :'texts/pending'
end

get '/user/:id/texts/archive' do
  erb :'texts/archive'
end

post '/user/new' do
  "post request to make new user"
end

post '/user/:id/text/new' do
  "post request to make new text"
end





