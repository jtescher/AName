class HomeController < ApplicationController

   def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suggestions }
    end
  end

   def show
    @suggestions = Suggestion.all(:order => "created_at DESC" , :limit => 10)
    @suggestionsrnd = Suggestion.all(:order => 'rand()', :limit => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suggestions }
    end
  end

  def rules

    respond_to do |format|
      format.html # rules.html.erb
      format.xml  { render :xml => @home }
    end
  end
end
