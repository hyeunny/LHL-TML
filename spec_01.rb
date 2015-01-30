require './spec_helper'
ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'rack/test'

describe Text do 
	include Rack::Test::Methods
	
	def app
    Text.new
  end

	before :each do 
		@text = Text.new
	end 

	describe "associations" do 
		it "should be able to get its user" do 
			expect { @text.user }.to_not raise_error
		end 
	end 
end 