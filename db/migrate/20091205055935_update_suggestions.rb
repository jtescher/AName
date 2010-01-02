class UpdateSuggestions < ActiveRecord::Migration
  def self.up
    remove_column :suggestions, :surname_suggestion
    remove_column :suggestions, :comments
    remove_column :suggestions, :email
  end

  def self.down
    add_column :suggestions, :surname_suggestion
    add_column :suggestions, :comments
    add_column :suggestions, :email
  end
end
