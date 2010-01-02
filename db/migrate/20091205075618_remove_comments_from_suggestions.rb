class RemoveCommentsFromSuggestions < ActiveRecord::Migration
  def self.up
    remove_column :suggestions, :comment_id
  end

  def self.down
    add_column :suggestions, :comment_id, :integer
  end
end
