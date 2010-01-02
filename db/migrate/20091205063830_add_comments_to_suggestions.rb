class AddCommentsToSuggestions < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :comment_id, :integer
  end

  def self.down
    remove_column :suggestions, :comment_id
  end
end
