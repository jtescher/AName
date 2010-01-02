class CreateSuggestions < ActiveRecord::Migration
  def self.up
    create_table :suggestions do |t|
      t.string :name
      t.string :email
      t.string :surname_suggestion
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :suggestions
  end
end
