class CreateTextTable < ActiveRecord::Migration
  def change
  	create_table :texts do |t|
  		t.string :recipient_phone_number
  		t.string :content
  		t.date :send_time
  		t.references :user
  		t.string :status
  		t.timestamps
  	end
  end
end
