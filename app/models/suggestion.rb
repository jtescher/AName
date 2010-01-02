class Suggestion < ActiveRecord::Base


  validate do |@suggestion|
    @suggestion.errors.add_to_base("6 or less characters if you don't mind") if @suggestion.name.length > 6
  end

  validate do |@suggestion|
    @suggestion.errors.add_to_base("6 or less characters if you don't mind") if @suggestion.name.length==0
  end
  
  belongs_to :users
  has_many :comments

end