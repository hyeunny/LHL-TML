class AddGroupText < ActiveRecord::Migration
  def change
  	create_table :group_texts do |t|
  		t.references :users
  		t.string :group_name
  		t.string :phone_num 
  		t.timestamps
  	end 
  end
 end
