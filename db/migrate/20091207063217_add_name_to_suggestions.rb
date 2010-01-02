class AddNameToSuggestions < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :user_name, :string
  end

  def self.down
    remove_column :suggestions, :user_name
  end
end
