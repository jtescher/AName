class AddSuggestionsToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :suggestion_id, :integer
  end

  def self.down
    remove_column :comments, :suggestion_id
  end
end
