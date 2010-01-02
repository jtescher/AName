class AddDescriptionToSuggestions < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :description, :integer
  end

  def self.down
    remove_column :suggestions, :description
  end
end
