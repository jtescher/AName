class UpdateSuggestionDescription < ActiveRecord::Migration
  def self.up
    remove_column :suggestions, :description
    add_column :suggestions, :description, :string
  end

  def self.down
    remove_column :suggestions, :description
    add_column :suggestions, :description, :integer
  end
end
