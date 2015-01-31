# Homepage (Root path)
helpers do 
require 'date'
require 'active_support/all'
	def current_user 
		if session[:user_id]
		  @user = User.find(session[:user_id])
    end
	end

  def new_user
    User.new(
      first_name:   params[:first_name],
      email:        params[:email],
      password:     params[:password],
      phone_number: params[:phone_number] 
    )

  end

  def login_user
     @user = User.where(email: params[:email], password: params[:password]).first
  end

  def new_message(converted_time)
    Text.new(
      recipient_phone_number: params[:recipient_phone_number],
      content:                params[:content],
      user_id:                params[:id],
      send_time:              converted_time
    )
  end

  def new_group 
    GroupText.new(
      phone_num: params[:phone_num], 
      group_name: params[:group_name],
      users_id: params[:user_id]
      )
  end  

  def convert_time_zone(time_zone, input_time)
    case time_zone
    when "AKST"
      input_time = input_time + 9.hours
    when "PST"
      input_time = input_time + 8.hours 
    when "MST"
      input_time = input_time + 7.hours
    when "CST"
      input_time = input_time + 6.hours
    when "EST"
      input_time = input_time + 5.hours
    when "AST"
      input_time = input_time + 4.hours
    when "NST"
      input_time = input_time + 3.hours + 30.minutes
    end
    input_time
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
  current_user
  erb :'users/show'
end

get '/user/:id/texts/pending' do
  @texts = Text.pending
  erb :'texts/pending'
end

get '/user/:id/texts/archive' do
  @texts = Text.archive
  erb :'texts/archive'
end

post '/user/new' do
  @user = new_user
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{session[:user_id]}"
  else
    erb :'users/new'
  end  
end

post '/login' do
  if login_user
    session[:user_id] = @user.id
    redirect "/user/#{session[:user_id]}"
  else
    erb :login
  end
end

post '/user/:id/text/new' do
  current_user
  converted_time = convert_time_zone(params[:timezone], params[:datetime].to_datetime)
  binding.pry
  @text = new_message(converted_time)

  if @text.save
    # @text.send_text(params[:recipient_phone_number], params[:content])
    redirect '/user/:id'
  else 
    erb :'users/show'
  end
end

get'/user/:id/group/new' do 
  current_user

  erb :'groups/new'
end 

post '/user/:id/group/new' do 
  current_user 
  @group = new_group 
  if @group.save
    redirect '/user/:id'
  else 
    erb :'users/show'
  end 
end 









