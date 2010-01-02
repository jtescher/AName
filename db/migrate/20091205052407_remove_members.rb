class RemoveMembers < ActiveRecord::Migration
  def self.up
    remove_index :members, :twitter_id
		remove_index :members, :screen_name
		drop_table :members
  end

  def self.down
      create_table :members do |t|
			t.column :twitter_id, :bigint, :null => false
			t.string :screen_name
			t.string :token
			t.string :secret
			t.string :profile_image_url
			t.timestamps
		end
		add_index :members, :twitter_id, :unique => true
		add_index :members, :screen_name, :unique => true
  end
end
