class SuggestionsController < ApplicationController
  # GET /suggestions
   before_filter :login_required
   
  # GET /suggestions.xml
  def index
    @suggestions = Suggestion.all(:order => "created_at DESC" , :limit => 10)
    @suggestionsrnd = Suggestion.all(:order => 'rand()', :limit => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suggestions }
    end
  end

  # GET /suggestions/1
  # GET /suggestions/1.xml
  def show
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @suggestion }
    end
  end

  def tweet
    @suggestion = Suggestion.find(params[:id])
    current_user.twitter.post('/statuses/update.json', 'status' => 'I agree with the name: ' + @suggestion.name + ' #ANameForMe http://www.anamefor.me' )
    flash[:notice] = 'Your vote has been tweeted!'

    respond_to do |format|
    if flash[:notice] == 'Your vote has been tweeted!'
     format.html { redirect_to(@suggestion) }
     format.xml  { render :xml => @suggestion, :status => :created, :location => @suggestion }
    else
      flash[:notice] = 'Your suggestion has been tweeted, but still errors.'
      end
    end
  end

  # GET /suggestions/new
  # GET /suggestions/new.xml
  def new
    @suggestion = Suggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @suggestion }
    end
  end

  # GET /suggestions/1/edit
  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  # POST /suggestions
  # POST /suggestions.xml
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    @suggestion.user_id = current_user.id
    @suggestion.user_name = current_user.login



    respond_to do |format|
      if @suggestion.save
        flash[:notice] = 'Your suggestion has been submitted and tweeted.'
        current_user.twitter.post('/statuses/update.json', 'status' => 'I suggested the name: ' + @suggestion.name + ' #ANameForMe http://www.anamefor.me' )

        format.html { redirect_to(@suggestion) }
        format.xml  { render :xml => @suggestion, :status => :created, :location => @suggestion }
      else
        @cerror = '<div class="error_image"><img src="/images/characterlimit.png"></div>'
        format.html { render :action => "new" }
        format.xml  { render :xml => @suggestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suggestions/1
  # PUT /suggestions/1.xml
  def update
    @suggestion = Suggestion.find(params[:id])

    respond_to do |format|
      if @suggestion.update_attributes(params[:suggestion])
        flash[:notice] = 'Suggestion was successfully updated.'
        format.html { redirect_to(@suggestion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @suggestion.errors, :status => :unprocessable_entity }
      end
    end
  end
end



