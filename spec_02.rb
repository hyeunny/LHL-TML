ENV['RACK_ENV'] ||= 'test'

require 'rspec'
require 'rack/test'
require './spec_helper'

describe Text do
  before :each do
    @text = Text.new
  end

  describe '#recipient_phone_number' do
    it "is required" do
      @text.recipient_phone_number = nil
      expect(@text).to_not be_valid
      expect(@text.errors[:recipient_phone_number]).to eq(["can't be blank","is the wrong length (should be 10 characters)"])
    end

    it "should return invalid phonenumber" do
      @text.recipient_phone_number = 9827362
      expect(@text).to_not be_valid
      expect(@text.errors[:recipient_phone_number]).to eq(["is the wrong length (should be 10 characters)"])
    end

    it "should have some content" do 
  		@text.content = nil 
  		expect(@text).to_not be_valid
  		expect(@text.errors[:content]).to eq(["can't be blank"])    
    end 
  end
end