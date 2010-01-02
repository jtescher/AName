class UpdateUsernameForComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :user_id
    add_column :comments, :user_name, :string

  end

  def self.down
    remove_column :comments, :user_name
    add_column :comments, :user_id, :integer
  end
end
