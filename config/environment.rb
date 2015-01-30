require 'rubygems'
require 'bundler/setup'

require 'twilio-ruby'
require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
<<<<<<< HEAD
require 'whenever'

=======
>>>>>>> b4ebfc90842a6950a7d03841467577426c0675a3
require 'pry'


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

#setting up twilio account 
#ENV[:account_sid] = 'ACa8a4fcd6af4ee24daee4a7f031a0497f'
#ENV[:auth_token] = '511b81412170f75d71b0a0ca5d8eaa51'


# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')
