# Homepage (Root path)


get '/' do
  erb :index 
end

get '/user/new' do
  "signup chris"
end

get '/login' do
  "login"
end

get '/user/:id' do
  "user page"
end

get '/user/:id/texts/pending' do
  "pending texts"
end

get '/user/:id/texts/archive' do
  "archived texts"
end

post '/user/new' do
  "post request to make new user"
end

post '/user/:id/text/new' do
  "post request to make new text"
end





