# Homepage (Root path)
helpers do 
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

  def new_message
    Text.new(
      recipient_phone_number: params[:recipient_phone_number],
      content:                params[:content],
      user_id:                params[:id],
      send_time:              params[:datetime]
    )
  end

  def new_group 
    GroupText.new(
      phone_num: params[:phone_num], 
      group_name: params[:group_name],
      users_id: params[:user_id]
      )
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
  @text = new_message
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









