require 'rubygems'
require 'bundler/setup'
require 'active_support/all'
require 'active_record'
require 'sinatra/activerecord'
require 'rack/test'
require 'sinatra/base'
require 'rspec'
require './app/models/user'
require './app/models/text'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Text.new
end
# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/db.sqlite3"
)

ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end